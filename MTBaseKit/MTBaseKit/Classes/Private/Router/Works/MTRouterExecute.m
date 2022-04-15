//
//  MTRouterExecute.m
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/11/4.
//

#import "MTRouterExecute.h"

#import "MTRouterComponent+briefMethods.h"
#import "MTRouterHelper.h"
#import "MTRouterUrlParser.h"
#import "MTRouterMapperNode.h"

#import <pthread/pthread.h>


#import "MTAnnotate.h"
#import <YYModel/YYModel.h>

@interface MTRouterExecute ()
@property(nonatomic, strong) MTRouterMapperNode *routerNodesMap; ///< 路由表--事件
@property(nonatomic, strong) NSObject <MTRouterInterceptorProtocol> *globalInterceptor; ///< 全局拦截器

- (instancetype)init_routerExecute;
@end

@implementation MTRouterExecute

static MTRouterExecute *imp;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imp = [(MTRouterExecute *) [super allocWithZone:zone] init_routerExecute];
    });
    return imp;
}

- (instancetype)init {  return imp;}

- (id)copyWithZone:(NSZone *)zone { return imp;}

- (id)mutableCopyWithZone:(NSZone *)zone { return imp;}

- (instancetype)init_routerExecute {
    if (self = [super init]) {
        self.routerNodesMap = [MTRouterMapperNode new];
    }
    return self;
}

- (void)initRouterConfig {
    if (self.routerNodesMap.isNodesEmpty) { //没有节点
        @synchronized (self) {
            if (self.routerNodesMap.isNodesEmpty) { //没有节点
                NSArray<MTAnnotation *> *funcs = [[MTAnnotate new].annotations objectForKey:[[NSString alloc] initWithCString:MTRouterComponent_flag encoding:NSUTF8StringEncoding]];
                [funcs enumerateObjectsUsingBlock:^(MTAnnotation *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
                    /**
                     1. 此处一次性执行所有路由的注册函数.
                     2. 后期可以考虑做优化, 每个路由第一次被调用的时候,才执行它的注册函数, 提升时间效率.[借助YKAnnotationRegisterSEL宏的externStr 字段, 实现url 与 执行函数的映射]
                     */
                    obj.macho_O_method();
                }];
            }
        }
    }
}

# pragma mark - public methods
- (void)deregisterAllUrls {
    [self.routerNodesMap ykCleanNodes];
}

- (BOOL)registerUrlPartterns:(NSString *)urlParttern error:(NSError **)err action:(MTRouterUrlExecuteAction)urlExecuteAction {
    BOOL result = NO;
    result = [self.routerNodesMap ykInsertOneNodeWithUrl:urlParttern executeAction:urlExecuteAction error:err];
    return result;
}

- (BOOL)deregisterUrl:(NSString *)url {
    NSError *err;
    MTRouterMapperNode *node = [self.routerNodesMap ykSearchNodeWithUrl:url absoluteFlag:YES error:&err];
    [node ykDeregisteNode];
    return YES;
}

/// 全局拦截器
- (void)setRouterGlobalInterceptor:(NSObject <MTRouterInterceptorProtocol> *)globalInterceptor {
    self.globalInterceptor = globalInterceptor;
}

- (void)openUrl:(MTRouterUrlRequest *)request complete:(MTRouterUrlCompletion) complete {
    NSError *err = nil;
    MTRouterUrlRequest *requestUsing = nil;
    
    MTRouterMapperNode *node = [self yk_filterUrNodeWithRequest:[request copy] requestBack:&requestUsing error:&err];
    
    if (err) { //失败
        MTRouterUrlResponse *response = [MTRouterUrlResponse instanceWithBuilder:^(MTRouterUrlResponse * _Nonnull response) {
            response.err = err;
            response.msg =  err.localizedDescription;
            response.status = err.code;
        }];
        
        if (complete) complete(response);
        return;
    }
    
    MTRouterUrlExecuteAction action = node.executeAction;
    if (action){
        MTRouterUrlCompletion com = ^(MTRouterUrlResponse *urlResponse){ //此处只是为了方便调试.
            if (complete) complete(urlResponse);
        };
        action(requestUsing, com);
        
    }else{
        [MTRouterHelper mt_createError:MTRouterComponentErrorCode_noUrl info:nil message:@"路由失败,注册的路由没有设置响应事件"];
    }
}

- (BOOL)canOpenUrl:(NSString *)url parameter:(NSDictionary *__nullable)parameters absolute:(BOOL)absolute error:(NSError *__nullable *__nullable)err {
    NSError *errBack = nil;
    
    MTRouterUrlRequest *request = [MTRouterUrlRequest instanceWithBuilder:^(MTRouterUrlRequest * _Nonnull builder) {
        builder.url = url; builder.paramater = parameters;
    }];
    
    [self yk_filterUrNodeWithRequest:request requestBack:nil error:&errBack];
    
    if (errBack) {
        if (err) {
            *err = errBack;
        } else { //业务失败,发送方未判断错误, 此处在终端和日志系统中反馈一下
            [MTRouterHelper mt_createError:MTRouterComponentErrorCode_noUrl info:nil message:@"路由检查能否开启失败,发起方未接受异常信息"];
        }
        return NO;
    }
    return YES;
}

- (NSString *)routerMapperJsonString {
    return [self.routerNodesMap ykRouterMapperJsonString];
}

- (NSDictionary *)routerMapperDict {
    return [self.routerNodesMap ykRouterMapperDict];
}

# pragma mark - work methods
//MTRouterUrlRequest
- (MTRouterMapperNode *)yk_filterUrNodeWithRequest:(MTRouterUrlRequest*)request requestBack:(MTRouterUrlRequest **)requestBack error:(NSError **)err {
    [self initRouterConfig];
    
    NSString *url = request.url;
    NSDictionary *paramaters = request.paramater;
    BOOL absolute = request.absolute;
    
    MTRouterUrlParser *parser = [MTRouterUrlParser ykParserUrl:request.url parameter:request.paramater];
    NSMutableDictionary *para = [NSMutableDictionary new];
    [para addEntriesFromDictionary:[parser queryparamaters]];
    [request.paramater enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL *_Nonnull stop) {
        NSString *value = [[NSString stringWithFormat:@"%@", obj] stringByRemovingPercentEncoding];
        [para setObject:value forKey:key];
    }];
    
    NSString *interceptorMes = nil;
    /** 此处需要进入全局拦截流程 */
    if ([self.globalInterceptor respondsToSelector:@selector(routerShouldOpenUrlParttern:parameter:msessageBack:)]) {
        // 全局判断是否可打开URL
        BOOL result = [self.globalInterceptor routerShouldOpenUrlParttern:parser.urlParttern parameter:para msessageBack:&interceptorMes];
        if (!result) { //url 不能被打开
            NSString *errMsg = interceptorMes.length ? interceptorMes : [NSString stringWithFormat:@"Url was closed by server:[%@]", [parser.url stringByRemovingPercentEncoding]];
            NSError *errBack = [MTRouterHelper mt_createError:MTRouterComponentErrorCode_urlClosed info:nil message:errMsg];
            
            if (err) *err = errBack;
            return nil;
        }
    }
    
    if ([self.globalInterceptor respondsToSelector:@selector(routerWhetheExchangeUrlParttern:parameter:urlPartternBack:parameterBack:messageBack:)]) {
        // 全局拦截去, URL是否被切换
        NSDictionary *paraUsed = nil;
        NSString *urlUsed = nil;
        BOOL exchangeFlag = [self.globalInterceptor routerWhetheExchangeUrlParttern:parser.urlParttern parameter:para urlPartternBack:&urlUsed parameterBack:&paraUsed messageBack:&interceptorMes];
        if (exchangeFlag) { //URL 或者 参数 被交换了
            url = urlUsed;
            para = [paraUsed mutableCopy];
        }
    }
    
    NSError *errBack;
    MTRouterMapperNode *node = [self.routerNodesMap ykSearchNodeWithUrl:url absoluteFlag:absolute error:&errBack];
    
    if (errBack) { //没有找到节点
        if (err) *err = errBack;
        return nil;
    }
    
    paramaters = para;
    NSURLComponents *componentSource = [NSURLComponents componentsWithString:url];
    //重组URL, 将paramaters参数变为 query
    NSMutableArray<NSURLQueryItem *> *queryArr = [NSMutableArray new];
    [queryArr addObjectsFromArray:componentSource.queryItems];
    [paramaters enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL *_Nonnull stop) {
        NSString *value = [[NSString stringWithFormat:@"%@", obj] stringByRemovingPercentEncoding];
        NSURLQueryItem *item = [[NSURLQueryItem alloc] initWithName:key value:value];
        [queryArr addObject:item];
    }];
    queryArr.count ? componentSource.queryItems = queryArr : 0;
    NSString *urlBack = componentSource.URL.absoluteString;
    
    MTRouterUrlParser *parserUsed = [MTRouterUrlParser ykParserUrl:urlBack parameter:paramaters];
    NSString *urlPartternBack = parserUsed.urlParttern;
    
    if (requestBack) {
        MTRouterUrlRequest *request_used = [request copy];
        request_used.url = urlBack;
        request_used.urlParttern = urlPartternBack;
        request_used.paramater = paramaters;
        *requestBack = request_used;
    }
    
    return node;
}
@end
