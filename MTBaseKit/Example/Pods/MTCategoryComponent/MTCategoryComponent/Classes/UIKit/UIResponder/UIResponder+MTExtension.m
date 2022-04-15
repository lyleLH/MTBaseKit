//
//  UIResponder+MTExtension.m
//  MTCategoryComponent
//
//  Created by Tom.Liu on 2021/6/18.
//

#import "UIResponder+MTExtension.h"

@implementation UIResponder (MTExtension)
-(void)mt_passEventName:(NSString *)eventName fromObject:(id )obj withUserInfo:(NSDictionary *)userInfo {
   [[self nextResponder] mt_passEventName:eventName fromObject:obj withUserInfo:userInfo];
}

@end
