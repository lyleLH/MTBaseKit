//
//  MTRouterComponentDefines.h
//  Pods
//
//  Created by stephen.chen on 2021/11/4.
//

#ifndef MTRouterComponentDefines_h
#define MTRouterComponentDefines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MTRouterUrlResponse;
typedef void(^MTRouterUrlCompletion)(MTRouterUrlResponse *urlResponse);

@class MTRouterUrlRequest;
typedef void(^MTRouterUrlExecuteAction)(MTRouterUrlRequest *urlRequest, MTRouterUrlCompletion completetion);

@protocol MTRouterInterceptorProtocol <NSObject>

/**
 是否可以打开URL
 
 @discussion URL 默认是可以打开的.
 
 @param urlParttern 注册的URL
 @param parameter URL 参数
 @param msgBack 回调
 */
- (BOOL)routerShouldOpenUrlParttern:(NSString *)urlParttern parameter:(NSDictionary<NSString *, NSString *> *)parameter msessageBack:(NSString * __nonnull *__nullable)msgBack;

- (BOOL)routerWhetheExchangeUrlParttern:(NSString *)url parameter:(NSDictionary<NSString *, NSString *> *)parameter urlPartternBack:(NSString *__nonnull *__nullable)urlBack parameterBack:(NSDictionary *__nonnull *__nullable)paraBack messageBack:(NSString *__nonnull *__nullable)msgBack;

@end

FOUNDATION_EXPORT NSErrorDomain const MTRouterError_domain;
FOUNDATION_EXPORT NSErrorUserInfoKey const MTRouterError_descriptionKey;

FOUNDATION_EXPORT NSString const *MTRouterWildcard_domain;

typedef NS_ENUM(NSInteger, MTRouterComponentErrorCode) {
    MTRouterComponentErrorCode_success = 0, /// < 业务成功
    MTRouterComponentErrorCode_noUrl = -1, /// < URL未注册
    MTRouterComponentErrorCode_urlClosed = -2, /// < URL关闭
    MTRouterComponentErrorCode_urlDuplicate = -3, /// < 重复注册URL
};

typedef NS_ENUM(NSInteger, MTRouterAnimationType) {
    MTRouterAnimationType_push = 0, /// < 压栈切换界面
    MTRouterAnimationType_present, /// < 模态切换界面
};

NS_ASSUME_NONNULL_END

#endif /* MTRouterComponentDefines_h */
