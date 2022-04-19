//
//  MTRouterComponent.h
//  Pods-YKRouterComponent_Example
//
//  Created by stephen.chen on 2021/11/3.
//

#import <Foundation/Foundation.h>

#import "MTRouterComponentDefines.h"
#import "MTRouterParameter.h"

#import "MTAnnotate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTRouterComponent : NSObject

+ (instancetype)shareInstance;

/**
 注册URL
 
 @param urlParttern url字符串
 @param urlExecuteAction url执行事件
 @param err 错误回调
 */
- (BOOL)registerUrlPartterns:(NSString *)urlParttern error:(NSError **)err action:(MTRouterUrlExecuteAction)urlExecuteAction;

/**
 取消注册URL
 
 @param url url字符串
 */
- (BOOL)deregisterUrl:(NSString *)url;

/**
 清除注册过的路由
 */
- (void)deregisterAllUrls;

/**
 设置全局拦截器
 
 @discussion URL 在打开的过程中, 提供了全局拦截的机会, 用以支持通过拦截表来开启或关闭某些URL.
 
 @param globalInterceptor 全局拦截器
 */
- (void)setRouterGlobalInterceptor:(NSObject<MTRouterInterceptorProtocol> *)globalInterceptor;

/**
 打开URL
 
 @param request 请求
 @param complete 回调
 */
- (void)openUrl:(MTRouterUrlRequest *)request complete:(MTRouterUrlCompletion) complete;

/**
 检查是否可以开启URL
 
 @discussion 检查路由能否开启的时候,有3个要素:
 1. urlparttern 被取消了
 2. 精准匹配, 没有匹配到完整urlparttern的路由节点
 3. 模糊匹配, 没有匹配到任何可以用的路由节点.
 
 @param url URL
 @param parameters 参数
 @param absolute 绝对匹配/模糊匹配
 @param err 错误信息
 */
- (BOOL)canOpenUrl:(NSString *)url parameter:(NSDictionary *__nullable)parameters absolute:(BOOL)absolute error:(NSError *__nullable *__nullable)err;

# pragma mark - debug methods
- (NSString *)routerMapperJsonString;
- (NSDictionary *)routerMapperDict;
@end

NS_ASSUME_NONNULL_END
