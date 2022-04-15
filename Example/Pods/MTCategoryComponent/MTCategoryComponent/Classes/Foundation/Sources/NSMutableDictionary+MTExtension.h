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
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (MTExtension)
//对象赋值
- (void)mt_safeSetObject:(id)object forKey:(id)key;

//基本类型赋值
- (void)mt_safeSetBoolObject:(BOOL)number forKey:(id)key ;
- (void)mt_safeSetIntObject:(int)number forKey:(id)key ;
- (void)mt_safeSetIntegerObject:(NSInteger)number forKey:(id)key ;
- (void)mt_safeSetUnsignedIntegerObject:(NSUInteger)number forKey:(id)key ;
- (void)mt_safeSetCharObject:(char)c forKey:(id)key ;
- (void)mt_safeSetDoubleObject:(double)number forKey:(id)key ;
- (void)mt_safeSetFloatObject:(float)number forKey:(id)key ;
- (void)mt_safeSetLongLongObject:(long long)number forKey:(id)key ;
- (void)mt_safeSetCGFloatObject:(CGFloat)f forKey:(id)key ;
- (void)mt_safeSetPointObject:(CGPoint)point forKey:(id)key ;
- (void)mt_safeSetSizeObject:(CGSize)size forKey:(id)key ;
- (void)mt_safeSetRectObject:(CGRect)rect forKey:(id)key ;

//删除元素
- (void)mt_safeRemoveObjectForKey:(id)key ;
//遍历字典转化修改
- (void)mt_mapUsingBlock:(id (^)(id object, NSString *key))block ;
//筛选符合条件的键值对
- (void)mt_filterUsingBlock:(BOOL (^) (id object, NSString *key))findBlock stopWhenFind:(BOOL)stopWhenFind;
//删除符合条件的元素
- (void)mt_deleteUsingBlock:(BOOL (^)(id object, NSString *key))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete;
@end

NS_ASSUME_NONNULL_END
