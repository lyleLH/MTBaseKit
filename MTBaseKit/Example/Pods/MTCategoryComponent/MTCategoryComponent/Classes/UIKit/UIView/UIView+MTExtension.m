///**
/**
MTPlayground
Created by: Tom.Liu on 2021/1/11
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

#import "UIView+MTExtension.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+MTExtension.h"

@implementation UIView (MTExtension)
/*!
 * 删除所有的子视图
 */
- (void)mt_removeAllSubViews
{
    NSArray *subViews = [self subviews];
    if (!subViews) {
        return;
    }
    for (UIView *subView in subViews) {
        [subView removeFromSuperview];
    }
}
@end


@implementation UIView (MTDebug)


- (void)mt_bordering
{
    [self borderOfColor:[UIColor mt_randomColor] andWidth:1];
}

- (void)borderOfColor:(UIColor *)colour andWidth:(CGFloat)borderWidth
{
    self.layer.borderColor = colour.CGColor;
    self.layer.borderWidth = borderWidth;
}

- (void)mt_borderingSubviews
{
    [self propagateSelectorToSubviews:@selector(mt_bordering) withObject:nil];
}

- (void)mt_debugingView
{
    [self mt_bordering];
    self.backgroundColor = [UIColor mt_randomColor];
    NSLog(@"Debug: View: %@", self);
}

- (void)mt_debugingSubviews
{
    [self propagateSelectorToSubviews:@selector(mt_debugingView) withObject:nil];
}


- (void)propagateSelectorToSubviews:(SEL)selector withObject:(id)object
{
    for (UIView *subview in self.subviews) {
        if ([subview respondsToSelector:selector]) {
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [subview performSelector:selector withObject:object];
#pragma clang diagnostic pop
        }
        [subview propagateSelectorToSubviews:selector withObject:object];
    }
}

@end

////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 设置圆角 UIView (RounderCorner) ,直接通过layer设置,不会触发离屏渲染
//MARK:-
////////////////////////////////////////////////////////////////
@implementation UIView (RounderCorner)

/// 用插入ImageView的方式实现全圆角功能
/// @param radius 圆角大小
/// @param size ImageView的视图尺寸
- (void)mt_addRounderCornerWithRadius:(CGFloat)radius size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef cxt = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(cxt, self.backgroundColor.CGColor);
    CGContextSetStrokeColorWithColor(cxt, self.backgroundColor.CGColor);

    CGContextMoveToPoint(cxt, size.width, size.height-radius);
    CGContextAddArcToPoint(cxt, size.width, size.height, size.width-radius, size.height, radius);//右下角
    CGContextAddArcToPoint(cxt, 0, size.height, 0, size.height-radius, radius);//左下角
    CGContextAddArcToPoint(cxt, 0, 0, radius, 0, radius);//左上角
    CGContextAddArcToPoint(cxt, size.width, 0, size.width, radius, radius);//右上角
    CGContextClosePath(cxt);
    CGContextDrawPath(cxt, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [imageView setImage:image];
    [self insertSubview:imageView atIndex:0];
}

/// 设置顶部两角为圆角的view
/// @param cornerRadius radius
/// @param bgColor 背景颜色
- (CAShapeLayer *)mt_setTopCornerWithRadius:(CGFloat)cornerRadius bgColor:(UIColor *)bgColor {
    CAShapeLayer *layer = CAShapeLayer.layer;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    layer.path = path.CGPath;
    layer.fillColor = bgColor.CGColor;
    [self.layer insertSublayer:layer atIndex:0];
    return layer;
}

/// 设置底部两角为圆角的view
/// @param cornerRadius radius
/// @param bgColor 背景颜色
- (CAShapeLayer *)mt_setBottomCornerWithRadius:(CGFloat)cornerRadius bgColor:(UIColor *)bgColor {
    CAShapeLayer *layer = CAShapeLayer.layer;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    layer.path = path.CGPath;
    layer.fillColor = bgColor.CGColor;
    [self.layer insertSublayer:layer atIndex:0];
    return layer;
}

/// 设置底部四角为圆角的view
/// @param cornerRadius radius
/// @param bgColor 背景颜色
- (CAShapeLayer *)mt_setRoundCornerWithRadius:(CGFloat)cornerRadius bgColor:(UIColor *)bgColor {
    CAShapeLayer *layer = CAShapeLayer.layer;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
    layer.path = path.CGPath;
    layer.fillColor = bgColor.CGColor;
    [self.layer insertSublayer:layer atIndex:0];
    return layer;
}


@end
