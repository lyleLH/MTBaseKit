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

#import "NSDate+MTExtension.h"

@implementation NSDate (MTExtension)
 
/// 获得格式化的时间字符串
/// @param formateString 时间格式，如 2015-6-3 12:12:12, <formateString==nil>||<formateString==@""> 时使用默认格式 yyyy-MM-dd HH:mm:ss
- (NSString *)mt_stringWithFormate:(NSString *)formateString
{
    if (!formateString || [formateString isEqualToString:@""]) {
        formateString = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formateString;
    NSString *result = [dateFormatter stringFromDate:self];
    return result;
}


/// 创建NSDate实例  <formate =nil> 时 默认采用 <@"yyyy-MM-dd">
/// @param formatedDateString 时间格式的字符串 <如 2015-6-3 12:12:12>
/// @param formate 时间格式 <@"yyyy-MM-dd">||<@"yyyy-MM-dd HH:mm:ss">等
+ (NSDate *)mt_dateWithFormatedDateString:(NSString *)formatedDateString formate:(NSString *)formate
{
    if (!formatedDateString || formatedDateString <= 0) {
        return [NSDate date];
    }
    if (!formate || formate.length <= 0) {
        formate = @"yyyy-MM-dd";
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formate;
    NSDate *date = [dateFormatter dateFromString:formatedDateString];
    return date;
}



/// 获取当前时间字符串 默认格式 <@"yyyy-MM-dd HH:mm:ss">
+ (NSString *)currentDateString {
    return [self mt_currentDateStringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}
/// 获取当前时间字符串 默认格式 <@"yyyy-MM-dd">
+ (NSString *)currentDateString1{
    return [self mt_currentDateStringWithFormat:@"yyyy-MM-dd"];
}



/// 获取当前时间字符串
/// @param formatterStr 时间的格式
+ (NSString *)mt_currentDateStringWithFormat:(NSString *)formatterStr {
    // 获取系统当前时间
    NSDate *currentDate = [NSDate date];
    // 用于格式化NSDate对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置格式：yyyy-MM-dd HH:mm:ss
    formatter.dateFormat = formatterStr;
    // 将 NSDate 按 formatter格式 转成 NSString
    NSString *currentDateStr = [formatter stringFromDate:currentDate];
    // 输出currentDateStr
    return currentDateStr;
}

/// 时间字符串格式化  指定格式 <yyyy-MM-dd HH:mm:ss>
- (NSString *)mt_stringWithFormatDate {
    if (!self) {
        return @"";
    }
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    dateFormate.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateString = [dateFormate stringFromDate:self];
    
    return dateString;
}



/// 把NSDate转成相应格式的字符串
/// @param format 指定格式 如：<yyyy-MM-dd HH:mm:ss>
- (NSString *)mt_stringByFormate:(NSString *)format
{
    if (!format || format.length < 1) {
        format = @"yyyy-MM-dd HH:mm:ss";
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSString *dateString = [dateFormatter stringFromDate:self];
    
    return dateString;
}




/// 时间比较，返回时间戳
/// @param anotherDate 相等返回0 ||比date晚返回正时间戳 ||比date前返回负时间戳
- (NSInteger)mt_timestampWithCompareDate:(NSDate *)anotherDate
{
    if (!anotherDate) {
        return -1;
    }
    
    if (![anotherDate isKindOfClass:[NSDate class]]) {
        return -1;
    }
    
    return [self timeIntervalSinceDate:anotherDate];
}


////////////////////////////////////////////////////////////////
//MARK:-
//MARK:时间部件
//MARK:-
////////////////////////////////////////////////////////////////


/// 当前日期
+(NSString *)mt_currentDateString{
    return [self mt_currentDataYearAgo:0 MonthAgo:0 DayAgo:0];
}


/// 当前年份
- (NSInteger)mt_currentYear
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self mt_getDateComponentsByDate:currentDate];
    return [dateComponpents year];
}


/// 当前月份
- (NSInteger)mt_currentMonth
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self mt_getDateComponentsByDate:currentDate];
    return [dateComponpents month];
}


/// 当前天
- (NSInteger)mt_currentDay
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self mt_getDateComponentsByDate:currentDate];
    return [dateComponpents day];
}


/// 当前小时
- (NSInteger)mt_currentHour
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self mt_getDateComponentsByDate:currentDate];
    return [dateComponpents hour];
}


///  当前分
- (NSInteger)mt_currentMinute
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self mt_getDateComponentsByDate:currentDate];
    return [dateComponpents minute];
}


/// 当前秒
- (NSInteger)mt_currentSecond
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self mt_getDateComponentsByDate:currentDate];
    return [dateComponpents second];
}



/// 获得NSdate实例的时间部件
/// @param date 传入的NSDate实例
- (NSDateComponents *)mt_getDateComponentsByDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponpent = [calendar components:unitFlags fromDate:date];
    return dateComponpent;
}


/// 与当前日期的 间隔多少个年、月、日的时间 字符串，格式:<yyyy-MM-dd>
/// @param yearNum 间隔的年,多少年前
/// @param monthNum 间隔的月，多少月前
/// @param dayNum 间隔的天，多少天前
+(NSString*)mt_currentDataYearAgo:(NSInteger)yearNum MonthAgo:(NSInteger)monthNum DayAgo:(NSInteger)dayNum{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [NSDate date];
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:-yearNum];
    [adcomps setMonth:-monthNum];
    [adcomps setDay:-dayNum];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:date options:0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [formatter stringFromDate:newdate];
    return str;
    
}


/// 与当前日期的 间隔多少个年、月、日的时间 字符串，格式:<yyyy-MM-dd HH:mm:ss>
/// @param yearOffset 间隔多少个年
/// @param monthOffset 间隔多少个月
/// @param dayOffset 间隔多少个天
- (NSDate *)mt_dateWithYearOffset:(NSInteger)yearOffset monthOffset:(NSInteger)monthOffset dayOffset:(NSInteger)dayOffset {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //    NSDateComponents *comps = nil;
    //    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:yearOffset];
    [adcomps setMonth:monthOffset];
    [adcomps setDay:dayOffset];
    return [calendar dateByAddingComponents:adcomps toDate:self options:0];
}


/// 0 时区的时间
- (NSDate *)mt_zeroOfDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    
    NSTimeInterval ts = (double)(int)[[calendar dateFromComponents:components] timeIntervalSince1970];
    return [NSDate dateWithTimeIntervalSince1970:ts];
}


/// 当前时间是否在 几点某分～几点某分之间
/// @param fromHour 起点的时间-小时
/// @param toHour 终点的时间-小时
/// @param min 起点的时间-分钟
/// @param tomin 终点的时间-分钟
+ (BOOL)mt_isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour formin:(NSInteger)min tomin:(NSInteger)tomin
{
    NSDate *dateform = [NSDate mt_getCustomDateWithHour:fromHour min:min sec:0];
    NSDate *dateto = [NSDate mt_getCustomDateWithHour:toHour min:tomin sec:0];
    NSDate *currentDate = [NSDate date];
    if ([currentDate compare:dateform]==NSOrderedDescending&&
        [currentDate compare:dateto]==NSOrderedAscending)
    {
        //        NSLog(@"该时间在 %d:00-%d:00 之间!",fromHour,toHour);
        return YES;
    }
    return NO;
}

/// 当前时间是否在 几点～几点之间
/// @param fromHour 起点的时间-小时
/// @param toHour 终点的时间-小时
+ (BOOL)mt_isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour
{
    NSDate *date8 = [NSDate mt_getCustomDateWithHour:fromHour min:0 sec:0];
    NSDate *date23 = [NSDate mt_getCustomDateWithHour:toHour min:59 sec:59];
    NSDate *currentDate = [NSDate date];
    if ([currentDate compare:date8]==NSOrderedDescending&&
        [currentDate compare:date23]==NSOrderedAscending)
    {
//        NSLog(@"该时间在 %d:00-%d:00 之间!",fromHour,toHour);
        return YES;
    }
    return NO;
}


/// 创建一个当前年月日中的某个时、分、秒的时间对象
/// @param hour 指定的小时
/// @param min 指定的分钟
/// @param sec 指定的秒
+ (NSDate *)mt_getCustomDateWithHour:(NSInteger)hour min:(NSInteger)min sec:(NSInteger)sec
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    [resultComps setMinute:min];
    [resultComps setSecond:sec];
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}

/// 获取某个月份的总天数
+ (NSInteger)mt_numberOfDaysInMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}


/// 获取下个月的天数
+ (NSInteger)mt_numberOfDaysInNextMonth{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSCalendar *calendar1 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    [lastMonthComps setMonth:+1];
    NSDate *newdate = [calendar1 dateByAddingComponents:lastMonthComps toDate:currentDate options:0];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:newdate];
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}



////////////////////////////////////////////////////////////////
//MARK:-
//MARK:链式语法
//MARK:-
////////////////////////////////////////////////////////////////

- (NSString *(^)(NSString *))mt_format {
    return ^ NSString * (NSString *formatString) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = formatString;
        return [formatter stringFromDate:self];
    };
}


- (NSString *)mt_format:(NSString *)formatString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatString;
    return [formatter stringFromDate:self];
}


+ (NSDate *(^)(NSString *,NSString *))mt_format {
    return ^ NSDate * (NSString *dateStirng, NSString *formatString) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = formatString;
        return [formatter dateFromString:dateStirng];
    };
}

@end
