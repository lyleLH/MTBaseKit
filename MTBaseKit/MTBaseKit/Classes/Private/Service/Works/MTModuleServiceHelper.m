//
//  MTModuleServiceHelper.m
//  MTModuleServiceComponent
//
//  Created by stephen.chen on 2021/11/8.
//

#import "MTModuleServiceHelper.h"

#import "MTModuleServicetDefines.h"

@implementation MTModuleServiceHelper
+ (NSError *)createError:(NSInteger)code info:(NSDictionary *__nullable)info message:(NSString *)msg {
    NSMutableDictionary *errInfo =
    [NSMutableDictionary dictionaryWithDictionary:
     @{
        NSLocalizedDescriptionKey: msg.length ? msg : @"MTModuleError unknow",
        NSLocalizedFailureReasonErrorKey : msg.length ? msg : @"MTModuleError unknow",
        MTModuleError_descriptionKey : msg.length ? msg : @"MTModuleError unknow",
    }];
    
    [errInfo addEntriesFromDictionary:info];
    NSError *error = [NSError errorWithDomain:MTModuleError_domain code:code userInfo:errInfo];
    return error;
}
@end
