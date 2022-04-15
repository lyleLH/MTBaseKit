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

#import "NSObject+MTExtension.h"
#import <objc/runtime.h>

@implementation MTSelector

- (void)perform:(id)obj id:(NSString *)identifier {
    if ([self.target respondsToSelector:self.action]) {
        IMP p = [self.target methodForSelector:self.action];
        if (obj) {
            void (*method)(id,SEL,NSString *,id) = (void *)p;
            method(self.target,self.action,identifier,obj);
        }else {
            void (*method)(id,SEL,NSString *) = (void *)p;
            method(self.target,self.action,identifier);
        }
    }
}

@end


@implementation NSObject (MTExtension)

- (void)mt_addTarget:(id)target sel:(SEL)sel identifier:(NSString *)identifer {
    if (!target || !sel) return;
    MTSelector *s = [MTSelector new];
    s.target = target;
    s.action = sel;
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(identifer), s, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)mt_addTarget:(id)target sel:(SEL)sel {
    [self mt_addTarget:target sel:sel identifier:NSStringFromSelector(sel)];
}

- (MTSelector *)mt_target:(NSString *)identifier {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(identifier));
}

- (void)mt_callSel:(NSString *)identifier obj:(id)obj {
    MTSelector *s = objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(identifier));
    [s perform:obj id:identifier];
}

- (void)mt_removeTarget:(NSString *)identifier {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(identifier), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 函数的同步异步执行
//MARK:-
////////////////////////////////////////////////////////////////


- (void)mt_performAsyncBlockInBackground:(void (^)(void))pBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), pBlock);
}
- (void)mt_performSyncBlockInBackground:(void (^)(void))pBlock {
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), pBlock);
}
- (void)mt_performAsyncBlockOnMainThread:(void (^)(void))pBlock {
    dispatch_async(dispatch_get_main_queue(), pBlock);
}
- (void)mt_performSyncBlockOnMainThread:(void (^)(void))pBlock {
    dispatch_sync(dispatch_get_main_queue(), pBlock);
}


////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 归档和解档
//MARK:-
////////////////////////////////////////////////////////////////


///归档 必须在对象中实现 <-initWithCoder:>中手动调用此方法
- (void)mt_encodeObjectWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);

    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //kvc取出属性值，归档
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
}

//解档
- (void)mt_decodeObjectCoder:(NSCoder *)aDecoder{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //kvc取出属性值，解档
        id value = [aDecoder decodeObjectForKey:key];
        //设置到成员变量身上
        [self setValue:value forKey:key];
    }
    free(ivars);
}
@end
