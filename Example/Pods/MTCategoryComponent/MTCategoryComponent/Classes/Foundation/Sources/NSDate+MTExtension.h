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

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MTExtension)
/// 获得格式化的时间字符串
/// @param formateString 时间格式，如 2015-6-3 12:12:12, <formateString==nil>||<formateString==@""> 时使用默认格式 yyyy-MM-dd HH:mm:ss
- (NSString *)mt_stringWithFormate:(NSString *)formateString;

/// 创建NSDate实例  <formate =nil> 时 默认采用 <@"yyyy-MM-dd">
/// @param formatedDateString 时间格式的字符串 <如 2015-6-3 12:12:12>
/// @param formate 时间格式 <@"yyyy-MM-dd">||<@"yyyy-MM-dd HH:mm:ss">等
+ (NSDate *)mt_dateWithFormatedDateString:(NSString *)formatedDateString formate:(NSString *)formate;



/// 获取当前时间字符串 默认格式 <@"yyyy-MM-dd HH:mm:ss">
+ (NSString *)currentDateString ;
/// 获取当前时间字符串 默认格式 <@"yyyy-MM-dd">
+ (NSString *)currentDateString1 ;

/// 获取当前时间字符串
/// @param formatterStr 时间的格式
+ (NSString *)mt_currentDateStringWithFormat:(NSString *)formatterStr;
/// 时间字符串格式化  指定格式 <yyyy-MM-dd HH:mm:ss>
- (NSString *)mt_stringWithFormatDate ;
/// 把NSDate转成相应格式的字符串
/// @param format 指定格式 如：<yyyy-MM-dd HH:mm:ss>
- (NSString *)mt_stringByFormate:(NSString *)format;

/// 时间比较，返回时间戳
/// @param anotherDate 相等返回0 ||比date晚返回正时间戳 ||比date前返回负时间戳
- (NSInteger)mt_timestampWithCompareDate:(NSDate *)anotherDate;

////////////////////////////////////////////////////////////////
//MARK:-
//MARK:时间部件
//MARK:-
////////////////////////////////////////////////////////////////


/// 当前日期
+(NSString *)mt_currentDateString ;
/// 当前年份
- (NSInteger)mt_currentYear;
/// 当前是几月
- (NSInteger)mt_currentMonth;
/// 当前是几号
- (NSInteger)mt_currentDay;
/// 当前几点
- (NSInteger)mt_currentHour;
/// 当前几分
- (NSInteger)mt_currentMinute;


/// 当前秒
- (NSInteger)mt_currentSecond;
/// 获得NSdate实例的时间部件
/// @param date 传入的NSDate实例
- (NSDateComponents *)mt_getDateComponentsByDate:(NSDate *)date;
/// 与当前日期的 间隔多少个年、月、日的时间 字符串，格式:<yyyy-MM-dd>
/// @param yearNum 间隔的年,多少年前
/// @param monthNum 间隔的月，多少月前
/// @param dayNum 间隔的天，多少天前
+(NSString*)mt_currentDataYearAgo:(NSInteger)yearNum MonthAgo:(NSInteger)monthNum DayAgo:(NSInteger)dayNum;
/// 与当前日期的 间隔多少个年、月、日的时间 字符串，格式:<yyyy-MM-dd HH:mm:ss>
/// @param yearOffset 间隔多少个年
/// @param monthOffset 间隔多少个月
/// @param dayOffset 间隔多少个天
- (NSDate *)mt_dateWithYearOffset:(NSInteger)yearOffset monthOffset:(NSInteger)monthOffset dayOffset:(NSInteger)dayOffset ;
/// 0 时区的时间
- (NSDate *)mt_zeroOfDate;
/// 当前时间是否在 几点某分～几点某分之间
/// @param fromHour 起点的时间-小时
/// @param toHour 终点的时间-小时
/// @param min 起点的时间-分钟
/// @param tomin 终点的时间-分钟
+ (BOOL)mt_isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour formin:(NSInteger)min tomin:(NSInteger)tomin;

/// 当前时间是否在 几点～几点之间
/// @param fromHour 起点的时间-小时
/// @param toHour 终点的时间-小时
+ (BOOL)mt_isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour;
/// 创建一个当前年月日中的某个时、分、秒的时间对象
/// @param hour 指定的小时
/// @param min 指定的分钟
/// @param sec 指定的秒
+ (NSDate *)mt_getCustomDateWithHour:(NSInteger)hour min:(NSInteger)min sec:(NSInteger)sec;

/// 获取某个月份的总天数
+ (NSInteger)mt_numberOfDaysInMonth ;
/// 获取下个月的天数
+ (NSInteger)mt_numberOfDaysInNextMonth;

////////////////////////////////////////////////////////////////
//MARK:-
//MARK:链式语法
//MARK:-
////////////////////////////////////////////////////////////////

- (NSString *(^)(NSString *))mt_format ;
- (NSString *)mt_format:(NSString *)formatString;
+ (NSDate *(^)(NSString *,NSString *))mt_format ;
@end

NS_ASSUME_NONNULL_END
