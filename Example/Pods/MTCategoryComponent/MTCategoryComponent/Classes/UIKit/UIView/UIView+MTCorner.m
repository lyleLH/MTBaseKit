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

#import "UIView+MTCorner.h"

@implementation UIView (MTCorner)
-(void)mt_cornerStyle:(MTCornerStyle)cornerStyle cornerRadius:(CGFloat) radius {
    
    UIRectCorner corners;
    
    switch (cornerStyle )
    {
        case MTCornerStyleLeftTop:
            corners = UIRectCornerTopLeft;
            break;
        case MTCornerStyleRightTop:
            corners = UIRectCornerTopRight;
            break;
        case MTCornerStyleLeftBottom:
            corners = UIRectCornerBottomLeft;
            break;
        case MTCornerStyleRightBottom:
            corners = UIRectCornerBottomRight;
            break;
        case MTCornerStyleTopAll:
            corners = UIRectCornerTopLeft | UIRectCornerTopRight;
            break;
        case MTCornerStyleBottomAll:
            corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case MTCornerStyleLeftAll:
            corners = UIRectCornerTopLeft | UIRectCornerBottomLeft;
            break;
        case MTCornerStyleRightAll:
            corners = UIRectCornerTopRight | UIRectCornerBottomRight;
            break;
        case MTCornerStyleAll:
            corners = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case MTCornerStyleNoLeftTop:
            corners = UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case MTCornerStyleNoRightTop:
            corners = UIRectCornerTopLeft  | UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
            
        case MTCornerStyleNoLeftBottom:
            corners = UIRectCornerTopLeft | UIRectCornerTopRight  | UIRectCornerBottomRight;
            break;
            
        case MTCornerStyleNoRightBottom:
            corners = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft ;
            break;
            
        default:
            corners = UIRectCornerAllCorners;
            break;
    }
    
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius*2, radius*2)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}
@end
