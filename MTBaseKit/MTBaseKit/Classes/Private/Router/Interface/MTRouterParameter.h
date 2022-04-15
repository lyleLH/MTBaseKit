//
//  YKRouterParameter.h
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/12/2.
//

#import <Foundation/Foundation.h>

#import "MTRouterComponentDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTRouterUrlRequest : NSObject<NSCopying>
@property(nonatomic, copy) NSString * url; ///< url
@property (nonatomic,assign) BOOL absolute; ///< 绝对匹配URL
@property(nonatomic, copy) NSString * urlParttern; ///< urlParttern

@property(nonatomic, assign) MTRouterAnimationType animateTyepe; ///< 界面切换类型
@property(nonatomic, copy) NSDictionary * paramater; ///< 参数

+ (instancetype)instanceWithBuilder:(void(^)(MTRouterUrlRequest *builder))builderAction;
@end

@interface MTRouterUrlResponse : NSObject<NSCopying>
@property (nonatomic,assign) NSInteger status; ///< 业务码
@property (nonatomic, strong) NSDictionary * __nullable responseObj; ///< 应答数据
@property(nonatomic, copy) NSString * msg; ///< 业务应当信息
@property (nonatomic, strong) NSError * __nullable err; ///< 业务错误对象

+ (instancetype)instanceWithBuilder:(void(^)(MTRouterUrlResponse *response))builderAction;
@end

NS_ASSUME_NONNULL_END
