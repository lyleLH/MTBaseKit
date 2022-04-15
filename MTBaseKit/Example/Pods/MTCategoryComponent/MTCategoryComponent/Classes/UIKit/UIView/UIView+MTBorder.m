///**
/**
MTPlayground
Created by: Tom.Liu on 2021/1/13
Github : https://github.com/lyleLH

 	 * ⣿⣿⣿⣿⣿⣿⢟⣡⣴⣶⣶⣦⣌⡛⠟⣋⣩⣬⣭⣭⡛⢿⣿⣿⣿⣿
	 * ⣿⣿⣿⣿⠋⢰⣿⣿⠿⣛⣛⣙⣛⠻⢆⢻⣿⠿⠿⠿⣿⡄⠻⣿⣿⣿ 
	 * ⣿⣿⣿⠃⢠⣿⣿⣶⣿⣿⡿⠿⢟⣛⣒⠐⠲⣶⡶⠿⠶⠶⠦⠄⠙⢿ 
	 * ⣿⠋⣠⠄⣿⣿⣿⠟⡛⢅⣠⡵⡐⠲⣶⣶⣥⡠⣤⣵⠆⠄⠰⣦⣤⡀ 
	 * ⠇⣰⣿⣼⣿⣿⣧⣤⡸⢿⣿⡀⠂⠁⣸⣿⣿⣿⣿⣇⠄⠈⢀⣿⣿⠿ 
	 * ⣰⣿⣿⣿⣿⣿⣿⣿⣷⣤⣈⣙⠶⢾⠭⢉⣁⣴⢯⣭⣵⣶⠾⠓⢀⣴
	 * ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣉⣤⣴⣾⣿⣿⣦⣄⣤⣤⣄⠄⢿⣿
	 * ⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠈⢿
	 * ⣿⣿⣿⣿⣿⣿⡟⣰⣞⣛⡒⢒⠤⠦⢬⣉⣉⣉⣉⣉⣉⣉⡥⠴⠂⢸
	 * ⠻⣿⣿⣿⣿⣏⠻⢌⣉⣉⣩⣉⡛⣛⠒⠶⠶⠶⠶⠶⠶⠶⠶⠂⣸⣿
	 * ⣥⣈⠙⡻⠿⠿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⠿⠛⢉⣠⣶⣶⣿⣿
	 * ⣿⣿⣿⣶⣬⣅⣒⣒⡂⠈⠭⠭⠭⠭⠭⢉⣁⣄⡀⢾⣿⣿⣿⣿⣿⣿

*/

#import "UIView+MTBorder.h"
#import <Masonry/Masonry.h>

typedef NS_ENUM(NSUInteger, MTBorderTag) {
    MTBorderTagTop = 65532,
    MTBorderTagBottom = 65533,
    MTBorderTagLeft = 65534,
    MTBorderTagRight = 65535
};

@interface MTBorder ()
@property (nonatomic,weak) UIView *target;
@property (nonatomic,strong) UIView *border;
- (instancetype)initWithTarget:(UIView *)target;
@end

@interface MTBorderSettings ()
@property (nonatomic,assign) MTBorderTag tag;
@property (nonatomic,weak) UIView *target;
@property (nonatomic,weak) UIView *border;
@end

@implementation MTBorder
- (instancetype)initWithTarget:(UIView *)target {
    if (self = [super init]) {
        self.target = target;
    }
    return self;
}

- (MTBorderSettings *)top {
    MTBorderSettings *borderSettings = [MTBorderSettings new];
    if (![self configSettings:borderSettings flag:MTBorderTagTop]) {
        [self.border mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.target);
            make.height.mas_equalTo(1);
        }];
    }
    return borderSettings;
}
- (MTBorderSettings *)bottom {
    MTBorderSettings *borderSettings = [MTBorderSettings new];
    if (![self configSettings:borderSettings flag:MTBorderTagBottom]) {
        [self.border mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(self.target);
            make.height.mas_equalTo(1);
        }];
    }
    return borderSettings;
}
- (MTBorderSettings *(^)(CGFloat))bottomWith {
    return ^MTBorderSettings *(CGFloat value) {
        MTBorderSettings *borderSettings = [MTBorderSettings new];
        if (![self configSettings:borderSettings flag:MTBorderTagBottom]) {
            [self.border mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.target);
                make.bottom.equalTo(self.target).with.offset(-value);
                make.height.mas_equalTo(1);
            }];
        }
        return borderSettings;
    };
}
- (MTBorderSettings *)left {
    MTBorderSettings *borderSettings = [MTBorderSettings new];
    if (![self configSettings:borderSettings flag:MTBorderTagLeft]) {
        [self.border mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.target);
            make.width.mas_equalTo(1);
        }];
    }
    return borderSettings;
}
- (MTBorderSettings *)right {
    MTBorderSettings *borderSettings = [MTBorderSettings new];
    if (![self configSettings:borderSettings flag:MTBorderTagRight]) {
        [self.border mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self.target);
            make.width.mas_equalTo(1);
        }];
    }
    return borderSettings;
}
- (BOOL)configSettings:(MTBorderSettings *)settings flag:(MTBorderTag)tag {
    BOOL exist = NO;
    for (UIView *subView in self.target.subviews) {
        if (subView.tag == tag) {
            self.border = [self.target viewWithTag:tag];
            self.border.hidden = NO;
            exist = YES;
            break;
        }
    }
    if (!exist) {
        self.border = [UIView new];
        self.border.tag = tag;
        [self.target addSubview:self.border];
    }
    settings.tag = tag;
    settings.target = self.target;
    settings.border = self.border;
    return exist;
}

@end

@implementation MTBorderSettings
- (MTBorderSettings *(^)(UIColor *))color {
    return ^MTBorderSettings * (UIColor *color) {
        self.border.backgroundColor = color;
        return self;
    };
}
- (MTBorderSettings *(^)(CGFloat))width {
    return ^MTBorderSettings * (CGFloat width) {
        [self.border mas_updateConstraints:^(MASConstraintMaker *make) {
            if (self.tag == MTBorderTagTop || self.tag == MTBorderTagBottom) {
                make.height.mas_equalTo(width);
            }else if (self.tag == MTBorderTagLeft || self.tag == MTBorderTagRight) {
                make.width.mas_equalTo(width);
            }
        }];
        return self;
    };
}
- (MTBorderSettings *(^)(CGFloat))leftEdge {
    return ^MTBorderSettings * (CGFloat value) {
        [self.border mas_updateConstraints:^(MASConstraintMaker *make) {
            if (self.tag == MTBorderTagTop || self.tag == MTBorderTagBottom) {
                make.left.equalTo(self.target).with.offset(value);
            }else if (self.tag == MTBorderTagLeft || self.tag == MTBorderTagRight) {
                make.top.equalTo(self.target).with.offset(value);
            }
        }];
        return self;
    };
}
- (MTBorderSettings *(^)(CGFloat))rightEdge {
    return ^MTBorderSettings * (CGFloat value) {
        [self.border mas_updateConstraints:^(MASConstraintMaker *make) {
            if (self.tag == MTBorderTagTop || self.tag == MTBorderTagBottom) {
                make.right.equalTo(self.target).with.offset(-value);
            }else if (self.tag == MTBorderTagLeft || self.tag == MTBorderTagRight) {
                make.bottom.equalTo(self.target).with.offset(-value);
            }
        }];
        return self;
    };
}
- (void (^)(BOOL))hide {
    return ^void (BOOL value) {
        self.border.hidden = value;
    };
}
- (void (^)(void))remove {
    return ^void (void) {
        [self.border removeFromSuperview];
    };
}
@end

 
@implementation UIView (MTBorder)
- (MTBorder *)MTBorder {
    MTBorder *border = [[MTBorder alloc] initWithTarget:self];
    return border;
}

@end
