//
//  MTAnnotate.m
//  MTBaseKit
//
//  Created by imacN24 on 2022/4/12.
//

#import "MTAnnotate.h"
#include <mach-o/getsect.h>
#include <mach-o/dyld.h>
#include <stdlib.h>
@interface MTAnnotation()
@property (nonatomic,assign) struct MTAnnotationStruct funcInfo; ///< 事件
@property (nonatomic,copy) NSString *annotationType;  ///< 事件类型标识
@end

@implementation MTAnnotation

+ (instancetype)instanceWithFuncInfo:(struct MTAnnotationStruct)info {
    MTAnnotation *result = [[self alloc]init];
    struct MTAnnotationStruct func = (struct MTAnnotationStruct){NULL, NULL};
    memcpy(&func, &info, sizeof(struct MTAnnotationStruct));
    result.funcInfo = func;
    return result;
}

- (NSString *)annotationType {
    return self.funcInfo.typeFlag ? [[NSString alloc] initWithCString:self.funcInfo.typeFlag encoding:NSUTF8StringEncoding] : nil;
}

- (MTAnnotation_Mach_O_Method)macho_O_method {
    return self.funcInfo.executeMethod;
}

@end

 
@interface MTAnnotate ()
@property (nonatomic ,strong) NSDictionary<NSString *, NSArray<MTAnnotation *> *> *annotations; ///< mach_o注册的事件
@end

@implementation MTAnnotate

static MTAnnotate *imp;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imp = [(MTAnnotate *) [super allocWithZone:zone] init_annotationComponent];
    });
    return imp;
}

- (instancetype)init_annotationComponent {
    if (self = [super init]) {
        self.annotations = [NSMutableDictionary new];
    }
    return self;
}


- (instancetype)init {return imp;}
- (id)copyWithZone:(NSZone *)zone {return imp;}
- (id)mutableCopyWithZone:(NSZone *)zone {return imp;}



- (NSDictionary<NSString *,NSArray<MTAnnotation *> *> *)annotationFuncsDict {
    return self.annotations.count ? [NSDictionary dictionaryWithDictionary:self.annotations] : nil;
}

@end


NSMutableArray<MTAnnotation *>* readMachOFunctions(char *sectionName,const struct mach_header *mhp);


static void dyld_callback(const struct mach_header *mhp, intptr_t vmaddr_slide) {
    //macho_o section SEL
    NSArray<MTAnnotation *> *funsArr = readMachOFunctions(MTAnotationSection_SEL, mhp);
    NSMutableDictionary *dict = [MTAnnotate new].annotations;

    [funsArr enumerateObjectsUsingBlock:^(MTAnnotation * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!obj.annotationType.length) return;

        NSMutableArray *arr = dict[obj.annotationType];
        if (!arr) {
            arr = [NSMutableArray new];
            dict[obj.annotationType] = arr;
        }
        [arr addObject:obj];
    }];
}
__attribute__((constructor))
void initProphet(void) {
    _dyld_register_func_for_add_image(dyld_callback);
}

NSMutableArray<MTAnnotation *>* readMachOFunctions(char *sectionName,const struct mach_header *mhp){
    NSMutableArray<MTAnnotation *> *result = [NSMutableArray new];
    unsigned long size = 0;
#ifndef __LP64__
    uintptr_t *memory = (uintptr_t*)getsectiondata(mhp, SEG_DATA, sectionName, &size);
#else
    const struct mach_header_64 *mhp64 = (const struct mach_header_64 *)mhp;
    unsigned char *memory = (unsigned char *)(uintptr_t*)getsectiondata(mhp64, SEG_DATA, sectionName, &size);
#endif

    if (size != 0) {
        NSLog(@"found function section: %s", sectionName);
    }

    unsigned long perSize = sizeof(struct MTAnnotationStruct);
    for(int offset = 0; offset < size; ){
        struct MTAnnotationStruct *point = (struct MTAnnotationStruct*)(memory + offset);
        struct MTAnnotationStruct onfInfo;
        memcpy(&onfInfo, point, perSize);
        if (onfInfo.sectionFlag && strcmp(onfInfo.sectionFlag, sectionName) == 0) {
            [result addObject:[MTAnnotation instanceWithFuncInfo:onfInfo]];
        }
        offset += perSize;
    }
    return result;
}

static inline char* strdupNS(NSString* nss) {
    static const NSStringEncoding enc = NSUTF8StringEncoding;
    NSUInteger len = [nss lengthOfBytesUsingEncoding:enc];
    if (len <= 0) {
        return NULL;
    }
    char* cstr = malloc((size_t)(1 + len));
    if (![nss getCString:cstr maxLength:(1 + len) encoding:enc]) {
        free(cstr);
        return NULL;
    }
    return cstr;
}