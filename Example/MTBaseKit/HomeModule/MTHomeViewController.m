//
// Created by imacN24 on 2022/4/15.
// Copyright (c) 2022 Major Tom. All rights reserved.
//

#import "MTHomeViewController.h"
#import <MTBaseKit/MTBaseKitHeader.h>
#import <MTCategoryComponent/MTCategoryComponentHeader.h>
#import "MTHomeViewControllerProtocol.h"


@interface MTHomeViewController () <MTHomeViewControllerProtocol>

@end

@implementation MTHomeViewController {

}



@MTRouterRegister() {
    [[MTRouterComponent shareInstance] registerUrlPartterns:@"Home" error:nil action:^(MTRouterUrlRequest *_Nonnull urlRequest, MTRouterUrlCompletion _Nonnull completetion) {
        MTHomeViewController *vc = [MTHomeViewController new];
        [[UIViewController mt_topViewController] presentViewController:vc animated:YES completion:^{

        }];
    }];

}

@MTModuleServiceRegister(){
    MTModuleServiceRegisterExecute(MTHomeViewController.class, @protocol(MTHomeViewControllerProtocol), nil);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:^{

    }];
}

- (void)helloWorld {
    NSLog(@"hello world ");
}
@end