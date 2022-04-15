///**
/**
Categoties
Created by: Tom.Liu on 2021/1/4
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

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (MTExtension)


////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 字符串基本处理
//MARK:-
////////////////////////////////////////////////////////////////

/// 是否为合法的字符串  string!=nil && string!=NSNull && string.length>0
/// @param string 入参 字符串
+ (BOOL)mt_isValidateString:(NSString *)string;

/// 是否含有某字符串
/// @param subString 判断是否包含时传入的子串
- (BOOL)mt_containsString:(NSString*)subString;

/// 字符串
+ (NSString *(^)(NSString*ary))mt_s;

/// 字符串拼接
+ (NSString *(^)(NSArray<NSString*>*ary))mt_bonding;
/// 去除空格和回车,换行
- (NSString *)mt_trimSpaceString;

///去除字符串的前后空格
- (NSString*)mt_trim;



////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 编码解码、加密解密
//MARK:-
////////////////////////////////////////////////////////////////
///NSString转为NSData
- (NSData *)mt_data;

///NSString转为Char
- (const char *)mt_char;

///MD5加密
- (NSString *)mt_MD5String;
///SHA1加密
- (NSString *)mt_SHA1String;
///UTF-8编码
- (NSString *)mt_URLEncodedString;
/// 指定编码方式编码
/// @param encoding 指定某种编码方式
- (NSString *)mt_URLEncodeUsingEncoding:(NSStringEncoding)encoding;
///UTF-8解码
- (NSString *)mt_URLDecodedString;
/// 指定某种格式解码
/// @param encoding 指定的某种解码格式
- (NSString *)mt_URLDecodeUsingEncoding:(NSStringEncoding)encoding;
/// 用指定编码格式将 NSData 解码成字符串 -- 静态方法 ｜  另外还有一个NSData的 <mt_string:>  实例方法
+ (NSString *)mt_stringWithData:(NSData *)pData encoding:(NSStringEncoding)pEncoding ;
 
/// NSString base64编码成NSData
- (NSData *)mt_base64EncodedData ;
/// NSString base64编码成NSString
- (NSString *)mt_base64Encoded;
/// NSString base64解码成NSData
- (NSData *)mt_base64DecodedData ;
/// NSString base64解码成NSString
- (NSString *)mt_base64Decoded ;

////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 设备信息、App信息
//MARK:-
////////////////////////////////////////////////////////////////

///获取App的版本号字符串 1.23.45
+ (NSString*)mt_appVersion;
/// 获取App的build号
+ (NSString*)mt_appBuildVersion;
+ (NSString*)mt_appBundleId;
+ (NSString*)mt_appName;
// 获取设备IP地址
+ (NSString *)mt_getIPAddress ;
///设备版本号
+ (NSString *)mt_deviceVersion;
///把3段 6位的版本号 转换为6为数字字符串 (1.23.4 --> 102304)
///@param versions App的版本号字符串
+ (NSString *)mt_versionStrtingToNumberString:(NSString*)versions;
///设备唯一标识符 ，注意idfa的采集是否合法。
+ (NSString *)mt_UUID ;
////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 常用的 输入-字符串 验证
//MARK:-
////////////////////////////////////////////////////////////////

/// 是否为合法的email地址
- (BOOL)mt_isValidateEmail;
///中文判断
/// 是否是中文字符串 实例方法
- (BOOL)mt_isChineseString;
/// 是否是中文字符串  静态方法
+ (BOOL)mt_isChineseString:(NSString *)string;
/// 字符串中是否含有中文字符串 静态方法
/// @param text  传入字符串
+ (BOOL)mt_isContainsChineseChar:(NSString *)text;

/// /// 是否仅由中文、大小写字母、数字、下划线组成
- (BOOL)mt_isChineseLetterDigitalOrUnderline ;
/// /// 是否仅由中文、大小写字母、数字组成
- (BOOL)mt_isChineseLetterDigital ;
/// 十进制数字包括：0 1 2 3 4 5 6 7 8 9。一般用于判断单个字符     123456789 YES |  123456.789 NO | -123456789 NO
- (BOOL)y_isPureDecial;
///是否是数字串
- (BOOL)mt_isPureNumber;
/// 是否是有效的手机号
/// @param mobile 传入待验证的手机号
+ (BOOL)mt_isValidateMobile:(NSString *)mobile;
/// 是否是有效的手机号
- (BOOL)mt_isValidateMobile;
/// 是否仅由数字组成
- (BOOL)mt_isOnlyDigit;
/// 是否仅由大小写字母组成
- (BOOL)mt_isOnlyLetter;
/// 是否仅由数字、大小写字母组成
/// @param string 传入待验证的字符串
+ (BOOL)mt_isOnlyDigitLetter:(NSString *)string;
/// 是否仅由数字、大小写字母
- (BOOL)mt_isOnlyDigitLetter;
/// 是否仅由重复数字组成
- (BOOL)isDuplicateDigit;
/// 是否仅由连续数字组成
- (BOOL)isContinuousDigit;
/// 是否仅由数字、大小写字母、下划线组成
/// @param string 传入待验证的字符串
+ (BOOL)mt_isOnlyDigitLetterUnderline:(NSString *)string;
/// 是否仅由数字、大小写字母、下划线组成
- (BOOL)mt_isOnlyDigitLetterUnderline;
/// 是整数或者小数
- (BOOL)mt_isIntOrPoint;
/// 是否为正整数，成功返回整数数值，失败返回-1
- (NSInteger)mt_isPositiveInteger ;
/// 是否为正浮点型数,成功返回浮点数值，失败返回-1
- (float)mt_isPositiveFloat ;
/// 是否符合密码规则
/// @param passWord 传入待验证的密码
+ (BOOL)mt_isValidatePwd:(NSString *)passWord;
/// 是否由 min-max位的数字字母组合构成
/// @param min 最小位数
/// @param max 最大位数
- (BOOL)mt_isNumAndLetterCombWithMin:(int)min toMax:(int)max;
/// 验证密码位数
/// @param min 最小位数
/// @param max 最大位数
- (BOOL)mt_isValidatePwdMin:(int)min toMax:(int)max;
/// 是否符合密码规则，返回未符合的规则提示，6-20位｜必须有大、小写字母和数字｜不能含有中文｜不能含有非法字符
- (NSString *)mt_checkPaswordInvalidation ;
/// 是否符合身份证姓名规则 ，返回未符合的规则提示，姓名2-20位｜姓名需为汉字或字母
- (NSString *)mt_checkIdCardNameValid;
/// 修正浮点型精度丢失
/// @param str 传入接口取到的数据
+ (NSString *)mt_reviseFloatingPointStringAccuracyWith:(NSString *)str;

////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 货币转换
//MARK:-
////////////////////////////////////////////////////////////////

///   分转化成元 结果到小数点后2位，例如15.05,如果是0则显示为0 TODO:测试
- (NSString*)mt_changeYuan ;

/// 处理带符号的金额 eg:-439分
- (NSString*)mt_changeYuanWithSymbol ;

- (NSString*)mt_changeCent ;

- (NSString*)mt_changeTenthousand ;

///转换成百分比
- (NSString *)mt_changeToRate ;

//转换成浮点数 TODO:测试
-(NSString *)mt_changeFloat ;


////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 富文本
//MARK:-
////////////////////////////////////////////////////////////////

/// 将母串中含有的子串单独设定某个颜色，返回设置后的富文本字符串
/// @param string 母串
/// @param color 子串要设定的颜色
/// @param rangeString 子串
+ (NSMutableAttributedString *)mt_attributedString:(NSString *)string Color:(UIColor *)color rangeString:(NSString *)rangeString ;

/// 将母串（自身）中含有的子串单独设定某个字体，返回设置后的富文本字符串
/// @param font 子串要设定的字体
/// @param rangeString 子串
- (NSMutableAttributedString *)mt_attributedStringWithFont:(UIFont *)font rangeString:(NSString *)rangeString ;
/// 将母串（自身）中含有的子串单独设定某个字体、字色，返回设置后的富文本字符串
/// @param str 子串
/// @param color 子串要设定的字体颜色
/// @param font 子串要设定的字体
- (NSMutableAttributedString *)mt_attributedStringWithStr:(NSString *)str color:(UIColor *)color font:(UIFont *)font ;


////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 信息脱敏相关的
//MARK:-
////////////////////////////////////////////////////////////////

/// 银行卡账号脱敏 16位以上 只显示前6位和后4位明文｜8-16位 只显示前2位和后2位明文｜1-8位 只显示最后1位明文
- (NSString *)mt_bankAccountDesensitizationString;
/// 银行卡账户名脱敏 ，只显示名字，不显示姓（姓的第一位隐藏）
- (NSString *)mt_bankAccountNameDesensitizationString;
/// 手机号脱敏 只显示前3位和后4位
- (NSString *)mt_phoneNumberDesensitizationString;
/// 身份证号脱敏 只显示前6位和后4位明文
- (NSString *)mt_idCardNumberDesensitizationString;
/// TODO:待确认
- (NSString *)mt_seatNumberDesensitizationString;
///   只显示前三位明文 TODO:待确认
- (NSString *)mt_formataSterisk  ;
// 银行卡格式化，每隔4位加空格
+ (NSString*)mt_addSpaceBankNumber:(NSString*)strText;
 


////////////////////////////////////////////////////////////////
//MARK:-
//MARK:- 字符串计算
//MARK:-
////////////////////////////////////////////////////////////////


/// 固定高度和字号 计算字符串宽度
/// @param height 给定高度
/// @param fontSize 给定字号
- (float)mt_widthByLimitHeight:(float)height fontSize:(float)fontSize ;

/// 固定高度和字体 计算字符串宽度
/// @param height 给定高度
/// @param font 给定字体
- (float)mt_widthByLimitHeight:(float)height font:(UIFont *)font ;

/// 固定宽度和字号 计算字符串高度
/// @param width 给定宽度
/// @param fontSize 给定字号
- (float)mt_heightByLimitWidth:(float)width fontSize:(float)fontSize ;
/// 固定宽度和字号 计算字符串高度
/// @param width 给定宽度
/// @param font 给定字体
- (float)mt_heightByLimitWidth:(float)width font:(UIFont *)font ;
 

@end

NS_ASSUME_NONNULL_END
