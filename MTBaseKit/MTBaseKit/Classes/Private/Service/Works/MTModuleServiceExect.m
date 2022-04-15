//
//  MTModuleServiceExect.m
//  MTModuleServiceComponent
//
//  Created by stephen.chen on 2021/11/8.
//

#import "MTModuleServiceExect.h"

#import "MTModuleServicetDefines.h"
#import "MTModuleServiceHelper.h"
#import "MTModuleServiceComponent+briefMethods.h"

#import <pthread/pthread.h>

#import "MTAnnotate.h"

@interface MTModuleServiceExect()
{
    pthread_rwlock_t _lock_mtRWLock; ///< 读写锁
}
@property (nonatomic, strong) NSMapTable<Protocol *, Class> *modulesMap; ///< 模块表
@end

@implementation MTModuleServiceExect
static MTModuleServiceExect *imp;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imp = [(MTModuleServiceExect *) [super allocWithZone:zone] init_ModuleServiceExect];
    });
    return imp;
}

- (instancetype)init {return imp;}
- (id)copyWithZone:(NSZone *)zone {return imp;}
- (id)mutableCopyWithZone:(NSZone *)zone {return imp;}

- (instancetype)init_ModuleServiceExect {
    if (self = [super init]) {
        self.modulesMap = [NSMapTable strongToStrongObjectsMapTable];
        pthread_rwlock_t lock = PTHREAD_RWLOCK_INITIALIZER;
        self->_lock_mtRWLock = lock;
    }
    return self;
}

- (BOOL)registerModuleService:(Class)cls protocol:(Protocol *)protocol err:(NSError *__nullable *__nullable)err {
    if (!cls || !protocol) { //没有类或协议
        NSString *msg = [NSString stringWithFormat:@"No module class or module protocol, while registing module."];
        NSError *errBack = [MTModuleServiceHelper createError:1 info:nil message:msg];
        if (err) *err = errBack;
        NSAssert(0, msg);
        return NO;
    }
    
    pthread_rwlock_rdlock(&(self->_lock_mtRWLock)); ////读加锁
    Class existCls = [self.modulesMap objectForKey:protocol];
    pthread_rwlock_unlock(&(self->_lock_mtRWLock)); /// 读解锁

    if ([existCls isEqual:cls]) { //已经注册过
        NSString *msg = [NSString stringWithFormat:@"Class[%@] has been regist with protocol:[%@]", existCls, protocol];
        NSError *errBack = [MTModuleServiceHelper createError:1 info:nil message:msg];
        if (err) *err = errBack;
        NSAssert(0, msg);
        return NO;
    }
    
    pthread_rwlock_wrlock(&(self->_lock_mtRWLock)); /// 写加锁
    [self.modulesMap setObject:cls forKey:protocol];
    pthread_rwlock_unlock(&(self->_lock_mtRWLock)); /// 写解锁
    
    return YES;
}

- (__kindof Class)moduleWithProtocol:(Protocol *)protocol error:(NSError *__nullable *__nullable)err {
    [self initModuleConfig];
    pthread_rwlock_rdlock(&(self->_lock_mtRWLock)); ////读加锁
    Class cls = [self.modulesMap objectForKey:protocol];
    pthread_rwlock_unlock(&(self->_lock_mtRWLock)); /// 读解锁
    if (!cls) {
        NSString *msg = [NSString stringWithFormat:@"No class for protocol[%@], while get module.", protocol];
        NSError *errBack = [MTModuleServiceHelper createError:1 info:nil message:msg];
        if (err) *err = errBack;
    }
    return cls;
}

# pragma mark - work methods
- (void)initModuleConfig {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray<MTAnnotation *> * funcs = [MTAnnotate new].annotations[[[NSString alloc] initWithCString:MTModuleComponent_flag encoding:NSUTF8StringEncoding]];
        [funcs enumerateObjectsUsingBlock:^(MTAnnotation * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            /**
             1. 此处一次性执行所有路由的注册函数.
             2. 后期可以考虑做优化, 每个路由第一次被调用的时候,才执行它的注册函数, 提升时间效率
             */
            obj.macho_O_method();
        }];
    });
}
@end
