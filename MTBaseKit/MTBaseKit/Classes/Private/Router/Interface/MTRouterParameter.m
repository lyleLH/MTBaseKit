//
//  YKRouterParameter.m
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/12/2.
//

#import "MTRouterParameter.h"

#import <YYModel/YYModel.h>

@implementation MTRouterUrlRequest
+ (instancetype)instanceWithBuilder:(void (^)(MTRouterUrlRequest *builder))builderAction {
    if (!builderAction) return nil;
    MTRouterUrlRequest *result = [[[self class] alloc] init];
    builderAction(result);
    return [result copy];
}

- (id)copyWithZone:(NSZone *)zone {
    return [self yy_modelCopy];
}
@end

@implementation MTRouterUrlResponse
+ (instancetype)instanceWithBuilder:(void (^)(MTRouterUrlResponse *response))builderAction {
    MTRouterUrlResponse *result = [[[self class] alloc] init];
    builderAction(result);
    return [result copy];
}

- (id)copyWithZone:(NSZone *)zone {
    return [self yy_modelCopy];
}

@end
