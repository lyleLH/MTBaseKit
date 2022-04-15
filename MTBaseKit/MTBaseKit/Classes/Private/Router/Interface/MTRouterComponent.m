//
//  MTRouterComponent.m
//  Pods-YKRouterComponent_Example
//
//  Created by stephen.chen on 2021/11/3.
//

#import "MTRouterComponent.h"

#import "MTRouterExecute.h"

@interface MTRouterComponent ()
@end

@implementation MTRouterComponent

+ (instancetype)shareInstance {
    return [MTRouterComponent new];
}

- (BOOL)registerUrlPartterns:(NSString *)urlParttern error:(NSError **)err action:(MTRouterUrlExecuteAction)urlExecuteAction {
    return [[MTRouterExecute new] registerUrlPartterns:urlParttern error:err action:urlExecuteAction];
}

- (BOOL)deregisterUrl:(NSString *)url {
    return [[MTRouterExecute new] deregisterUrl:url];
}

- (void)deregisterAllUrls {
    [[MTRouterExecute new] deregisterAllUrls];
}

/// 全局拦截器
- (void)setRouterGlobalInterceptor:(NSObject <MTRouterInterceptorProtocol> *)globalInterceptor {
    [[MTRouterExecute new] setRouterGlobalInterceptor:globalInterceptor];
}

- (void)openUrl:(MTRouterUrlRequest *)request complete:(MTRouterUrlCompletion)complete {
    [[MTRouterExecute new] openUrl:request complete:complete];
}

- (BOOL)canOpenUrl:(NSString *)url parameter:(NSDictionary *__nullable)parameters absolute:(BOOL)absolute error:(NSError *__nullable *__nullable)err {
    return [[MTRouterExecute new] canOpenUrl:url parameter:parameters absolute:absolute error:err];
}

- (NSDictionary *)routerMapperDict {
    return [[MTRouterExecute new] routerMapperDict];
}

- (NSString *)routerMapperJsonString {
    return [[MTRouterExecute new] routerMapperJsonString];
}

@end
