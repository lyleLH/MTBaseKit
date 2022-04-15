//
//  UIView+MTEvent.m
//  MTCategoryComponent
//
//  Created by Tom.Liu on 2021/3/9.
//

#import "UIImageView+MTEvent.h"
#import "objc/runtime.h"
@implementation UIImageView (MTEvent)

static char overviewKey;

- (void)mt_imageViewOnTap:(void(^)(void))block {
    [self setBlock:block];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturePearls =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    [self addGestureRecognizer:tapGesturePearls];
}

- (void)setBlock:(void(^)(void))block {
    objc_setAssociatedObject (self, &overviewKey,block,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void(^)(void))block {
    return objc_getAssociatedObject(self, &overviewKey);
}

- (void)onTap {
    void(^block)(void);
    block = [self block];
    block();
}
@end
