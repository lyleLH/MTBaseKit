///**
/**
Categoties
Created by: Tom.Liu on 2021/1/8
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

@interface UIColor (MTExtension)
////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 常用的颜色方法
//MARK:-
////////////////////////////////////////////////////////////////

///随机色，饱和度低比较美观的随机颜色
+ (UIColor *)mt_randomColor;
///易于阅读的随机颜色对，<前景色、文字色 - 背景色>
+ (NSArray * )mt_randomPairColorForRead ;
/// 根据 hex字符串<"#123456">返回 UIcolor
/// @param hexString @"#1abc9c"],@"1abc9c"],@"#1ABC9C"]，不区分大小写自动过滤'#'
+ (UIColor *)mt_colorFromHexString:(NSString *)hexString ;
/// hex值返回UIcolor
/// @param hexValue 0x666666
+ (UIColor *)mt_colorWithHex:(int)hexValue;
/// hex值返回UIcolor
/// @param hexValue  0x666666
/// @param alpha 0～1.0
+ (UIColor *)mt_colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
/// 设置RGBA的值生成UIColor对象,Alpha =1.0
/// @param R Red  ：小数值，(0-255)/255.0
/// @param G Green：小数值，(0-255)/255.0
/// @param B Blue ：小数值，(0-255)/255.0
+ (UIColor *)mt_colorRGB:(CGFloat)R g:(CGFloat)G b:(CGFloat)B;
/// 设置RGBA的值生成UIColor对象
/// @param R Red  ：小数值，(0-255)/255.0
/// @param G Green：小数值，(0-255)/255.0
/// @param B Blue ：小数值，(0-255)/255.0
/// @param alpha Alpha ：小数值，0-1.0
+ (UIColor *)mt_colorRGBA:(CGFloat)R g:(CGFloat)G b:(CGFloat)B A:(CGFloat)alpha;
///// 渐变色
///// @param leftColor 左边颜色
///// @param rightColor 右边颜色
//+ (UIColor *)mt_gradientColorWithLeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor ;
///将某图片填充在某个视图的尺寸中后，获取其颜色，生成颜色对象
/// @param imageIn 填充的图片
/// @param view 图片填充的视图
+ (UIColor*)mt_colorFromImage:(UIImage *)imageIn fillInView:(UIView *)view ;

////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 收银通 App 的颜色配置
//MARK:-
////////////////////////////////////////////////////////////////
 
/// 主题颜色
+ (UIColor *)mt_sytAppThemeColor;
/// 按钮主题色 渐变  ，右边的颜色
+ (UIColor *)mt_themeGradientRightColor;
/// 主题色按钮 禁用状态的颜色 渐变   ，左边的颜色
+ (UIColor *)mt_themeDisabledGradientLeftColor;
/// 主题色按钮 禁用状态的颜色 渐变   ，右边的颜色
+ (UIColor *)mt_themeDisabledGradientRightColor;
/// 白色背景上的 禁用文字的颜色
+ (UIColor *)mt_disabledInWhiteBgTextColor;
/// 白色背景上的 文字颜色
+ (UIColor *)mt_normalInWhiteBgTextColor;
/// 白色背景上的 分割线颜色
+ (UIColor *)mt_normalInWhiteBgseparateLineColor;
/// 文字颜色为主题色的 按钮的 背景颜色
+ (UIColor *)mt_lightBlueBgColor ;
/// 文字颜色为黑色 列表cell 的 背景颜色
+ (UIColor *)mt_lightGrayBlueBgColor;
/// 列表的背景色
+ (UIColor *)mt_commonViewBgColor;
#pragma  mark -- 收款页面数字键盘 相关的颜色
/// 普通数字按钮的背景颜色
+ (UIColor *)mt_numpadNumbersBackgroundColor ;
/// 删除、清除按钮的背景颜色
+ (UIColor *)mt_numpadFunctionsBackgroundColor;

@end

NS_ASSUME_NONNULL_END
