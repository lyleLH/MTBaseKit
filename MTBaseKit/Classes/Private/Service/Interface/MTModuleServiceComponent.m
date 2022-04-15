//
//  MTModuleServiceComponent.m
//  MTModuleServiceComponent
//
//  Created by stephen.chen on 2021/11/8.
//

#import "MTModuleServiceComponent.h"

#import "MTModuleServiceExect.h"

@implementation MTModuleServiceComponent
- (BOOL)registerModuleService:(Class)cls protocol:(Protocol *)protocol err:(NSError *__nullable *__nullable)err {
    return [[MTModuleServiceExect new] registerModuleService:cls protocol:protocol err:err];
}

- (__kindof Class)moduleWithProtocol:(Protocol *)protocol error:(NSError *__nullable *__nullable)err {
    return [[MTModuleServiceExect new] moduleWithProtocol:protocol error:err];
}
@end
