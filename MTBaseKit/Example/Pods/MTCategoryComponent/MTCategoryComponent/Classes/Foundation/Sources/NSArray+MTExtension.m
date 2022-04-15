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

#import "NSArray+MTExtension.h"
#import "NSMutableArray+MTExtension.h"
@implementation NSArray (MTExtension)

- (id)mt_firstObject {
    if([self count] == 0) {
        return nil;
    }
    return [self objectAtIndex:0];
}

- (id)mt_lastObject {
    if([self count] == 0) {
        return nil;
    }
    return [self objectAtIndex:[self count] - 1];
}

- (NSArray *)mt_arrayByRemovingObjectsFromArray:(NSArray *)pArray {
    NSMutableArray *array = [self mutableCopy];
    [array removeObjectsInArray:pArray];
    return array;
}

- (NSArray *)mt_allObjectsWithKindOfClass:(Class)pClass {
    NSMutableArray *objects = [NSMutableArray array];
    for(id object in self) {
        if([object isKindOfClass:pClass]) {
            [objects addObject:object];
        }
    }
    return objects;
}

- (id)mt_firstObjectWithKindOfClass:(Class)pClass {
    for(id object in self) {
        if([object isKindOfClass:pClass]) {
            return object;
        }
    }
    return nil;
}


- (void)mt_enumerateObjectsWithKindOfClass:(Class)pClass usingBlock:(void (^)(id object, NSUInteger index, BOOL *stop))pBlock {
    if(pBlock == nil) {
        return;
    }
    BOOL stop = NO;
    for(NSInteger i = 0; i < [self count]; ++i) {
        id object = [self objectAtIndex:i];
        if([object isKindOfClass:pClass]) {
            pBlock(object, i, &stop);
        }
        if(stop) {
            break;
        }
    }
}


////////////////////////////////////////////////////////////////
//MARK:-
//MARK:- 更安全的操作
//MARK:-
////////////////////////////////////////////////////////////////



+ (BOOL)mt_isEmptyWithArray:(NSArray *)array {
    if (array && (array.count > 0)) {
        return NO;
    }
    return YES;
}

- (id)mt_safeObjectAtIndex:(NSInteger)index {
    if ((self.count > index) && (index >= 0)) {
        id obj = [self objectAtIndex:index];
        if (![obj isKindOfClass:[NSNull class]]) {
            return obj;
        }
    }
    NSLog(@"注意-------------->数组越界");
    return nil;
}

//取随机元素
- (id)mt_randomObject {
    if (self && self.count > 0) {
        NSInteger index = arc4random() % self.count;
        return [self mt_safeObjectAtIndex:index];
    }
    return nil;
}

//添加
- (NSMutableArray *)mt_safeAddObject:(id)object {
    NSMutableArray *mutArray = [NSMutableArray array];
    
    if (self) {
        [mutArray mt_safeAddObjectsFromArray:self];
    }
    [mutArray mt_safeAddObject:object];
    return mutArray;

}
//删除元素
- (NSMutableArray *)mt_safeArrayRemoveObjectAtIndex:(NSInteger)index {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self];
    [array mt_safeRemoveObjectAtIndex:index];
    return array;
}

//转换
- (NSArray *)mt_mapArrayUsingBlock:(id (^)(id, NSInteger))block {
    
    if (block) {
        __block NSMutableArray *array = [NSMutableArray array];
        
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [array mt_safeAddObject:block(obj, idx)];
        }];
        return [array copy];
    }
    return self;
}

//筛选
- (NSArray *)mt_filterArrayUsingBlock:(BOOL (^) (id object))findBlock stopWhenFind:(BOOL)stopWhenFind {
    
    if (findBlock) {
        __block NSMutableArray *array = [NSMutableArray array];
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (findBlock(obj)) {
                [array mt_safeAddObject:obj];
                *stop = stopWhenFind;
            }
        }];
        
        return [array copy];
    }
    return self;
}

//删除符合条件的元素
- (NSArray *)mt_deleteArrayUsingBlock:(BOOL (^)(id object))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete {
    
    if (deleteBlock) {
        __block NSMutableArray *array = [NSMutableArray array];
        NSMutableArray *mutArray = [NSMutableArray array];
        [mutArray mt_safeAddObjectsFromArray:self];
        
        [mutArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (deleteBlock(obj)) {
                [array mt_safeAddObject:obj];
                *stop = stopWhenDelete;
            }
        }];
        [mutArray removeObjectsInArray:[array copy]];
        return [mutArray copy];
    }
    
    return self;
}

//数组乱序
- (NSArray *)mt_shuffledArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    NSMutableArray *copy = [self mutableCopy];
    while (copy.count > 0)
    {
        NSInteger index = arc4random() % copy.count;
        id objectToMove = [copy objectAtIndex:index];
        [array addObject:objectToMove];
        [copy removeObjectAtIndex:index];
    }
    return [array copy];
}

//数组倒序
- (NSArray *)mt_reversedArray {
    NSArray *reversedArray = [[self reverseObjectEnumerator] allObjects];
    return reversedArray;
}

//数组去重
- (NSArray *)mt_uniqueArray {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([array containsObject:obj] == NO){
            [array addObject:obj];
        }
    }];
    return [array copy];
}



@end
