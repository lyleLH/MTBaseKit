//
//  MTRouterUrlParser.m
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/11/4.
//

#import "MTRouterUrlParser.h"

#import "MTRouterComponentDefines.h"

#import <YYModel/YYModel.h>

@interface MTRouterUrlParser ()
@property (nonatomic,copy) NSString *url;  ///< url
@property (nonatomic,copy) NSString *scheme;  ///< scheme
@property (nonatomic,copy) NSString *host;  ///< host
@property (nonatomic,strong) NSNumber *port;  ///< port
@property (nonatomic,copy) NSString *path;  ///< path
@property (nonatomic,copy) NSArray<NSString *> *pathComponents;  ///< path components
@property (nonatomic,copy) NSString *userName;  ///< user name
@property (nonatomic,copy) NSString *passWord;  ///< pass word
@property (nonatomic,copy) NSString *query;  ///< query
@property (nonatomic,copy) NSDictionary<NSString *, NSString*> *queryparamaters;  ///< query parameters
@property (nonatomic,copy) NSString *fragment;  ///< fragment
@property (nonatomic,copy) NSString *urlParttern;  ///< urlParttern
@end

@implementation MTRouterUrlParser
- (id)copyWithZone:(NSZone *)zone {
    return [self yy_modelCopy];
}

+ (instancetype)ykParserUrl:(NSString *)url parameter:(NSDictionary *)parameter {
    if(!url.length) return nil;
    
    MTRouterUrlParser *parser = [self new];
    [parser yk_parserUrl:url parameter:parameter];
    return parser;
}

- (NSArray<NSString *> *)ykUrlSeperateResult {
    NSMutableArray<NSString *> *url_parts = [NSMutableArray new];
    [url_parts addObject:self.scheme];
    self.host ? [url_parts addObject:self.host] : 0;
    self.port ? [url_parts addObject:[NSString stringWithFormat:@"%@", self.port]] : 0;
    [url_parts addObjectsFromArray:self.pathComponents];
    return [NSArray arrayWithArray: url_parts];
}

- (void)yk_parserUrl:(NSString *)url parameter:(NSDictionary *)parameter {
    /**
     需要考虑一个通配符的scheme,
          也需要考虑 通配符的host
         也需要考虑  通配符的port
     path 需要支持 容错, 下级路径没找到的时候, 可以用最后匹配到的路径来响应.
     openUrl的方法需要支持 绝对匹配和 容错匹配.
     
     scheme 没有, 会解析不出host
            port 会单独解析
     path 是一个整体
     query
     fragment
     */
    /**
     处理中文编码问题
     */
    url = [url stringByRemovingPercentEncoding];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLComponents *component = [NSURLComponents componentsWithString:url];
    NSString *scheme = @"ykr_scheme_wildcard";
    if (component.scheme.length == 0) { //没有scheme,或者scheme不合法.
        /**
         1.单独识别scheme[://], 记录在内存.
         2. 用一个合法的scheme替换,将URL的后半部分正确解析
         */
        NSString *url_extern = url;
        if ([url rangeOfString:@"://"].location != NSNotFound) {
            scheme = [url componentsSeparatedByString:@"://"].firstObject;
            url_extern = [[url componentsSeparatedByString:@"://"] lastObject];
        }
        
        NSString const * wildcardScheme = @"ykrouter://";
        url_extern = [wildcardScheme stringByAppendingString:url_extern];
        component = [NSURLComponents componentsWithString:url_extern];
    }else{
        scheme = component.scheme;
    }
    
    self.url = url;
    self.scheme = scheme;

    component.user.length ? self.userName = component.user : 0;
    component.password.length ? self.passWord = component.password : 0;
    component.host.length ? self.host = component.host : 0;
    component.port ? self.port = component.port : 0;
    
    if (component.path.length){
        NSMutableArray *arr = [NSMutableArray new];
        [[component.path pathComponents] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (![obj isEqualToString:@"/"]) [arr addObject:obj];
        }];
        
        self.path = component.path;
        self.pathComponents = [NSArray arrayWithArray:arr];
    }
    
    NSMutableDictionary *queryDict = [NSMutableDictionary new];
    [component.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [queryDict setObject:obj.value forKey:obj.name];
    }];
    queryDict.count ? self.queryparamaters = queryDict : 0;
    
    component.fragment.length ? self.fragment = component.fragment : nil;
    
    NSRange pathRan = [url rangeOfString:[self ykUrlSeperateResult].lastObject];
    NSString *parttern = [url substringToIndex:pathRan.location + pathRan.length];
    self.urlParttern = [parttern stringByRemovingPercentEncoding];
    
//    NSLog(@"url info:%@", [self yy_modelDescription]);
}

@end


