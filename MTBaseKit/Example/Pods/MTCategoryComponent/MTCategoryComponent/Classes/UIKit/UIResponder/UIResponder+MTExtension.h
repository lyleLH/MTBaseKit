//
//  UIResponder+MTExtension.h
//  MTCategoryComponent
//
//  Created by Tom.Liu on 2021/6/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (MTExtension)

-(void)mt_passEventName:(NSString *)eventName fromObject:(id )obj withUserInfo:(NSDictionary *)userInfo ;

@end

NS_ASSUME_NONNULL_END
