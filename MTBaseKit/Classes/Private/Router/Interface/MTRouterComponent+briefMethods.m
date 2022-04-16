//
//  MTRouterComponent+briefMethods.m
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/12/2.
//

#import "MTRouterComponent+briefMethods.h"

@implementation MTRouterComponent (briefMethods)

MTRouterComponent *RouterCenter(void) {
    return [MTRouterComponent shareInstance];
}

BOOL routerRegisterUrlParttern(NSString *urlParttern, NSError **errBack, MTRouterUrlExecuteAction executeAction) {
    return [RouterCenter() registerUrlPartterns:urlParttern error:errBack action:executeAction];
}

void routerOpenUrlRequest(MTRouterUrlRequest *request, MTRouterUrlCompletion complete) {
    [RouterCenter() openUrl:request complete:complete];
}

void deregisterAllUrls(void){
    [RouterCenter() deregisterAllUrls];
}

- (void)mt_openUrl:(NSString *)url {
    
    [self mt_openUrl:url param:@{}];
}

- (void)mt_openUrl:(NSString *)url param:(NSDictionary *)param {
    MTRouterUrlRequest * request  = [MTRouterUrlRequest instanceWithBuilder:^(MTRouterUrlRequest *builder) {
        builder.url = url;
        builder.paramater = param;
    }];
    [RouterCenter() openUrl:request complete:^(MTRouterUrlResponse *urlResponse){

    }];
}

@end
