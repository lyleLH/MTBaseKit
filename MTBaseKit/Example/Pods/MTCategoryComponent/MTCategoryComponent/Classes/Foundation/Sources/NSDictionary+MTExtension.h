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

@interface NSDictionary (MTExtension)


////////////////////////////////////////////////////////////////
//MARK:-
//MARK:- 更安全的操作
//MARK:-
////////////////////////////////////////////////////////////////






//是否有key
- (BOOL)mt_hasKey:(id)key;

//赋值
- (void)mt_safeSetValue:(id)value forKey:(id)key;

//取值
- (id)mt_safeValueForKey:(id)key;

- (NSString*)mt_stringForKey:(id)key;
- (NSNumber*)mt_numberForKey:(id)key;
- (NSArray*)mt_arrayForKey:(id)key;
- (NSDictionary*)mt_dictionaryForKey:(id)key;

- (NSInteger)mt_integerForKey:(NSString *)pKey;
- (NSUInteger)mt_unsignedIntegerForKey:(NSString *)pKey;
- (float)mt_floatForKey:(NSString *)pKey;
- (double)mt_doubleForKey:(NSString *)pKey;
- (BOOL)mt_boolForKey:(NSString *)pKey;

- (CGRect)mt_rectForKey:(NSString *)pKey;
- (CGSize)mt_sizeForKey:(NSString *)pKey;
- (CGPoint)mt_pointForKey:(NSString *)pKey;


//合并
+ (NSMutableDictionary *)mt_safeDictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;
- (NSMutableDictionary *)mt_safeDictionaryByMergingWith:(NSDictionary *)dict;


//转换为json字符串
- (NSString *)mt_safeJSONString;

//删除元素
- (NSDictionary *)mt_safeDictionaryRemoveObjectForKey:(id)key;

//遍历字典转化修改
- (NSDictionary *)mt_mapDictionaryUsingBlock:(id (^)(id object, NSString *key))block;

//筛选符合条件的键值对
- (NSDictionary *)mt_filterDictionaryUsingBlock:(BOOL (^) (id object, NSString *key))findBlock stopWhenFind:(BOOL)stopWhenFind;

//删除符合条件的元素
- (NSDictionary *)mt_deleteDictionaryUsingBlock:(BOOL (^)(id object, NSString *key))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete;

@end

NS_ASSUME_NONNULL_END
