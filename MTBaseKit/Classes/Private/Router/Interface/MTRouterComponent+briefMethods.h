//
//  MTRouterComponent+briefMethods.h
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/12/2.
//

#import "MTRouterComponent.h"

#import "MTAnnotate.h"


NS_ASSUME_NONNULL_BEGIN

#if defined(__cplusplus)
extern "C" {
#endif

#define MTRouterComponent_flag "MTRouter_flag"
/**
 注册路由
 
 code example:
 
 //@implementation YourClass
 @MTRouterRegister(){
 NSLog(@"register_Router");
 // Your code.
 }
 //@end
 
 */
#define MTRouterRegister() MTAnnotateRegister(MTRouterComponent_flag, "router_future")

@interface MTRouterComponent (briefMethods)
/**
 获取 MTRouterComponent 实例
 */
MTRouterComponent * RouterCenter(void);

/**
 注册URL
 @param urlParttern url parttern
 @param errBack 错误回调
 @param executeAction 响应事件
 */
BOOL routerRegisterUrlParttern(NSString * urlParttern, NSError **errBack, MTRouterUrlExecuteAction executeAction);

/**
 打开URL
 
 @param request 请求
 @param complete 回调
 */
void routerOpenUrlRequest(MTRouterUrlRequest *request, MTRouterUrlCompletion complete);

/**
 取消所有注册
 */
void deregisterAllUrls(void);

- (void)mt_openUrl:(NSString *)url;
- (void)mt_openUrl:(NSString *)url param:(NSDictionary *)param ;
@end

#if defined(__cplusplus)
}
#endif

NS_ASSUME_NONNULL_END
