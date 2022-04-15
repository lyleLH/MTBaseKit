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

@interface NSArray (MTExtension)

- (id)mt_firstObject;

- (id)mt_lastObject;


/// 从母数组中移除子数组中的对象后的对象数组
/// @param pArray 要移除的对象数组
- (NSArray *)mt_arrayByRemovingObjectsFromArray:(NSArray *)pArray;

/// ///从母数组中取得某个类的全部对象 后的数组
/// @param pClass 要筛选出来的对象所属的类
- (NSArray *)mt_allObjectsWithKindOfClass:(Class)pClass;

/// 数组中对象类型为某个类型的第一个对象
/// @param pClass 标定的类型
- (id)mt_firstObjectWithKindOfClass:(Class)pClass;

/// ///遍历数组中每一个其类型目标类型的对象 并回调
/// @param pClass 标定的类型
/// @param pBlock 回调
- (void)mt_enumerateObjectsWithKindOfClass:(Class)pClass usingBlock:(void (^)(id object, NSUInteger index, BOOL *stop))pBlock;



////////////////////////////////////////////////////////////////
//MARK:-
//MARK:- 更安全的操作
//MARK:-
////////////////////////////////////////////////////////////////


+ (BOOL)mt_isEmptyWithArray:(NSArray *)array ;

- (id)mt_safeObjectAtIndex:(NSInteger)index ;

///取随机元素
- (id)mt_randomObject ;
///添加
- (NSMutableArray *)mt_safeAddObject:(id)object ;
///删除元素
- (NSMutableArray *)mt_safeArrayRemoveObjectAtIndex:(NSInteger)index ;
///转换
- (NSArray *)mt_mapArrayUsingBlock:(id (^)(id, NSInteger))block ;
///筛选
- (NSArray *)mt_filterArrayUsingBlock:(BOOL (^) (id object))findBlock stopWhenFind:(BOOL)stopWhenFind ;
///删除符合条件的元素
- (NSArray *)mt_deleteArrayUsingBlock:(BOOL (^)(id object))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete ;
///数组乱序
- (NSArray *)mt_shuffledArray ;
///数组倒序
- (NSArray *)mt_reversedArray ;
///数组去重
- (NSArray *)mt_uniqueArray ;
@end

NS_ASSUME_NONNULL_END
