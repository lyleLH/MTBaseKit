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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MTExtension)
/*!
 * 删除所有的子视图
 */
- (void)mt_removeAllSubViews;


@end
////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 视图调试相关的 扩展 UIView (MTDebug)
//MARK:-
////////////////////////////////////////////////////////////////

@interface UIView (MTDebug)

///  为自身设一个随机颜色的边框
- (void)mt_bordering ;
///   为自身设一个指定颜色的边框
/// @param colour 指定颜色
/// @param borderWidth 边框宽度
- (void)borderOfColor:(UIColor *)colour andWidth:(CGFloat)borderWidth;
///  为自身的所有子视图设置一个随机颜色的边框
- (void)mt_borderingSubviews ;
/// 为自身设置一个Random color border 和 background color
- (void)mt_debugingView ;
/// 为自身的所有子视图 一个Random color border 和 background color
- (void)mt_debugingSubviews;
@end

 
////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 设置圆角 UIView (RounderCorner)
//MARK:-
////////////////////////////////////////////////////////////////
@interface UIView (RounderCorner)

/// 用插入ImageView的方式实现全圆角功能
/// @param radius 圆角大小
/// @param size ImageView的视图尺寸
- (void)mt_addRounderCornerWithRadius:(CGFloat)radius size:(CGSize)size ;
/// 设置顶部两角为圆角的view
/// @param cornerRadius radius
/// @param bgColor 背景颜色
- (CAShapeLayer *)mt_setTopCornerWithRadius:(CGFloat)cornerRadius bgColor:(UIColor *)bgColor ;
/// 设置底部两角为圆角的view
/// @param cornerRadius radius
/// @param bgColor 背景颜色
- (CAShapeLayer *)mt_setBottomCornerWithRadius:(CGFloat)cornerRadius bgColor:(UIColor *)bgColor ;
/// 设置底部四角为圆角的view
/// @param cornerRadius radius
/// @param bgColor 背景颜色
- (CAShapeLayer *)mt_setRoundCornerWithRadius:(CGFloat)cornerRadius bgColor:(UIColor *)bgColor;
@end

NS_ASSUME_NONNULL_END
