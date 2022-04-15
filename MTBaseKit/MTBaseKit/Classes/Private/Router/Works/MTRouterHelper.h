//
//  MTRouterHelper.h
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTRouterHelper : NSObject
+ (NSError *)mt_createError:(NSInteger)code info:(NSDictionary *)info message:(NSString *)msg;
@end

NS_ASSUME_NONNULL_END
