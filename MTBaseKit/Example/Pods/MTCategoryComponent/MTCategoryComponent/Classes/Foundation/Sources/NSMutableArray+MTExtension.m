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

#import "NSMutableArray+MTExtension.h"
#import "NSArray+MTExtension.h"
@implementation NSMutableArray (MTExtension)

//添加id数组元素
- (void)mt_safeAddObject:(id)object {
    if (object) {
        [self addObject:object];
    }
}

//从数组里添加元素
- (void)mt_safeAddObjectsFromArray:(NSArray *)array {
    if (array) {
        [self addObjectsFromArray:array];
    }
}

//插入元素
- (void)mt_safeInsertObject:(id)object atIndex:(NSInteger)index {
    if (object && (self.count > index) && index>=0) {
        [self insertObject:object atIndex:index];
    }
}
//替换
- (void)mt_safeReplaceObjectAtIndex:(NSInteger)index  withObject:(id)object
{
    if (object&&(self.count>index)&&index>=0) {
        [self replaceObjectAtIndex:index withObject:object];
    }
}

//添加基本类型数组元素
- (void)mt_safeAddObjectWithInteger:(NSInteger)number {
    [self mt_safeAddObject:@(number)];
}

- (void)mt_safeAddObjectWithDouble:(double)number {
    [self mt_safeAddObject:@(number)];
}

- (void)mt_safeAddObjectWithFloat:(float)number {
    [self mt_safeAddObject:@(number)];
}

- (void)mt_safeAddObjectWithLong:(long long)number {
    [self mt_safeAddObject:@(number)];
}

- (void)mt_safeAddObjectWithRang:(NSRange)rang{
    [self mt_safeAddObject:NSStringFromRange(rang)];
}

- (void)mt_safeAddObjectWithRect:(CGRect)rect{
    [self mt_safeAddObject:NSStringFromCGRect(rect)];
}

- (void)mt_safeAddObjectWithPoint:(CGPoint)point{
    [self mt_safeAddObject:NSStringFromCGPoint(point)];
}

- (void)mt_safeAddObjectWithSize:(CGSize)size{
    [self mt_safeAddObject:NSStringFromCGSize(size)];
}

//删除元素
- (void)mt_safeRemoveObjectAtIndex:(NSInteger)index {
    
    if ((self.count > index) && (index >= 0)) {
        [self removeObjectAtIndex:index];
    }
}

//转换
- (void)mt_mapUsingBlock:(id (^)(id, NSInteger))block {
    
    if (block) {
        __block NSMutableArray *array = [NSMutableArray array];
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [array mt_safeAddObject:block(obj, idx)];
        }];
        [self removeAllObjects];
        [self mt_safeAddObjectsFromArray:[array copy]];
    }
}

//筛选
- (void)mt_filterUsingBlock:(BOOL (^) (id object))findBlock stopWhenFind:(BOOL)stopWhenFind {
    
    if (findBlock) {
        __block NSMutableArray *array = [NSMutableArray array];
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (findBlock(obj)) {
                [array mt_safeAddObject:obj];
                *stop = stopWhenFind;
            }
        }];
        [self removeAllObjects];
        [self mt_safeAddObjectsFromArray:[array copy]];
    }
}

//删除符合条件的元素
- (void)mt_deleteUsingBlock:(BOOL (^)(id object))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete {
    
    if (deleteBlock) {
        __block NSMutableArray *array = [NSMutableArray array];
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (deleteBlock(obj)) {
                [array mt_safeAddObject:obj];
                *stop = stopWhenDelete;
            }
        }];
        [self removeObjectsInArray:[array copy]];
    }
}


//重组数组(打乱顺序)
- (void)mt_shuffle {
    NSMutableArray *copy = [self mutableCopy];
    [self removeAllObjects];
    
    while (copy.count > 0) {
        int index = arc4random() % copy.count;
        id objectToMove = [copy mt_safeObjectAtIndex:index];
        [self mt_safeAddObject:objectToMove];
        [copy mt_safeRemoveObjectAtIndex:index];
    }
}

//数组倒序
- (void)mt_reverse {
    NSArray *reversedArray = [[self reverseObjectEnumerator] allObjects];
    [self removeAllObjects];
    [self mt_safeAddObjectsFromArray:reversedArray];
}

//数组去重
- (void)mt_unique {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([array containsObject:obj] == NO){
            [array addObject:obj];
        }
    }];
    [self removeAllObjects];
    [self mt_safeAddObjectsFromArray:[array mutableCopy]];
}
@end
