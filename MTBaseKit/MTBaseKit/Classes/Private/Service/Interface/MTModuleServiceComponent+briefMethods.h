//
//  MTModuleServiceComponent+briefMethods.h
//  MTModuleServiceComponent
//
//  Created by stephen.chen on 2021/12/9.
//

#import "MTModuleServiceComponent.h"

#import "MTAnnotate.h"

NS_ASSUME_NONNULL_BEGIN

#if defined(__cplusplus)
extern "C" {
#endif

/// 服务组件标识
#define MTModuleComponent_flag "MTModule_flag"

#define MTModuleServiceRegister() MTAnnotateRegister(MTModuleComponent_flag, "module_future")

/**
 服务管理
 */
@interface MTModuleServiceComponent (briefMethods)
/**
 注册服务
 @param cls 服务类
 @param protocol 服务协议
 @param err 错误信息
 */
BOOL MTModuleServiceRegisterExecute(Class cls, Protocol * protocol, NSError *__nullable *__nullable err);

/**
 获取服务
 
 @param protocol 服务协议
 @param err 错误信息
 */
__kindof Class MTModuleServiceWithProtocol(Protocol *protocol, NSError *__nullable *__nullable err);
@end

#if defined(__cplusplus)
}
#endif

NS_ASSUME_NONNULL_END
