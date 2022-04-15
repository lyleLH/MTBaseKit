//
//  UIImageView+MTEvent.h
//  MTCategoryComponent
//
//  Created by Tom.Liu on 2021/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (MTEvent)
- (void)mt_imageViewOnTap:(void(^)(void))block;
@end

NS_ASSUME_NONNULL_END
