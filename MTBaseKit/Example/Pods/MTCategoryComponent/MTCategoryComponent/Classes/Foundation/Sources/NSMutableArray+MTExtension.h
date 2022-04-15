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

@interface NSMutableArray (MTExtension)
///添加id数组元素
- (void)mt_safeAddObject:(id)object;
///从数组里添加元素
- (void)mt_safeAddObjectsFromArray:(NSArray *)array;
///插入元素
- (void)mt_safeInsertObject:(id)object atIndex:(NSInteger)index ;
///替换
- (void)mt_safeReplaceObjectAtIndex:(NSInteger)index  withObject:(id)object;
///添加基本类型数组元素
- (void)mt_safeAddObjectWithInteger:(NSInteger)number;
- (void)mt_safeAddObjectWithDouble:(double)number;
- (void)mt_safeAddObjectWithFloat:(float)number ;
- (void)mt_safeAddObjectWithLong:(long long)number ;
- (void)mt_safeAddObjectWithRang:(NSRange)rang;
- (void)mt_safeAddObjectWithRect:(CGRect)rect;
- (void)mt_safeAddObjectWithPoint:(CGPoint)point;
- (void)mt_safeAddObjectWithSize:(CGSize)size;

///删除元素
- (void)mt_safeRemoveObjectAtIndex:(NSInteger)index ;

///转换
- (void)mt_mapUsingBlock:(id (^)(id, NSInteger))block ;
///筛选
- (void)mt_filterUsingBlock:(BOOL (^) (id object))findBlock stopWhenFind:(BOOL)stopWhenFind ;
///删除符合条件的元素
- (void)mt_deleteUsingBlock:(BOOL (^)(id object))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete;

///重组数组(打乱顺序)
- (void)mt_shuffle;
///数组倒序
- (void)mt_reverse;
///数组去重
- (void)mt_unique;
@end

NS_ASSUME_NONNULL_END
