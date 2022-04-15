//
//  MTViewController.m
//  MTBaseKit
//
//  Created by Major Tom on 04/12/2022.
//  Copyright (c) 2022 Major Tom. All rights reserved.
//

#import "MTViewController.h"
#import <MTBaseKit/MTBaseKitHeader.h>

@interface MTViewController ()

@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.4 green:0.3 blue:0.6 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[MTRouterComponent shareInstance] mt_openUrl:@"Home"];
}

@end
