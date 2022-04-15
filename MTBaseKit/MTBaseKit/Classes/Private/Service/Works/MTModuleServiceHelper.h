//
//  MTModuleServiceHelper.h
//  MTModuleServiceComponent
//
//  Created by stephen.chen on 2021/11/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTModuleServiceHelper : NSObject
+ (NSError *)createError:(NSInteger)code info:(NSDictionary *__nullable)info message:(NSString *)msg;
@end

NS_ASSUME_NONNULL_END
