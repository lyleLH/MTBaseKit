//
//  MTModuleServiceComponent+briefMethods.m
//  MTModuleServiceComponent
//
//  Created by stephen.chen on 2021/12/9.
//

#import "MTModuleServiceComponent+briefMethods.h"

@implementation MTModuleServiceComponent (briefMethods)

BOOL MTModuleServiceRegisterExecute(Class cls, Protocol * protocol, NSError *__nullable *__nullable err) {
    return [[MTModuleServiceComponent new] registerModuleService:cls protocol:protocol err:err];
}

__kindof Class MTModuleServiceWithProtocol(Protocol *protocol, NSError *__nullable *__nullable err) {
    return [[MTModuleServiceComponent new] moduleWithProtocol:protocol error:err];
}
@end
