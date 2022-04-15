//
//  MTRouterHelper.m
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/11/4.
//

#import "MTRouterHelper.h"

#import "MTRouterComponentDefines.h"

@implementation MTRouterHelper
+ (NSError *)mt_createError:(NSInteger)code info:(NSDictionary *)info message:(NSString *)msg {
    NSMutableDictionary *errInfo =
    [NSMutableDictionary dictionaryWithDictionary:
     @{
        NSLocalizedDescriptionKey: msg.length ? msg : @"MTRouterError unknow",
        NSLocalizedFailureReasonErrorKey : msg.length ? msg : @"MTRouterError unknow",
        MTRouterError_descriptionKey : msg.length ? msg : @"MTRouterError unknow",
    }];
    
    [errInfo addEntriesFromDictionary:info];
    NSError *error = [NSError errorWithDomain:MTRouterError_domain code:code userInfo:errInfo];
    NSLog(@"MTRouter open url error :%@", msg);
    return error;
}
@end
