//
//  MTAnnotate.h
//  MTBaseKit
//
//  Created by imacN24 on 2022/4/12.
//

#import <Foundation/Foundation.h>





#if defined(__cplusplus)
extern "C" {
#endif

//---------------------------------

typedef void(*MTAnnotation_Mach_O_Method)(void);

struct MTAnnotationStruct {
    char *sectionFlag; ///< 字符, 用以存放mach_o字段标识,用于在读取的时候判定是否是合法的struct.
    char *typeFlag; ///<  字符,用以存放SEL功能标识,长度不限制,用于标识SEL的功能类型.
    char *externStr; ///< 扩展信息, 为了便于以后扩展, 注意是字符串类型
    MTAnnotation_Mach_O_Method executeMethod; ///< 注册的SEL
};


#ifndef MTAnotationSection_SEL
#define MTAnotationSection_SEL "MT_AN_SEL"  // 此字符串不能太长,拼接后超过16个字符 编译会失败
#endif


#define merge_body(a, b) a ## b //合并用的主体
#define merge(a, b) merge_body(a, b) //中间层

#define _UNIQUE_ID(func)  merge(func, merge(_unused, __COUNTER__))


#define _MT_C_STRING_(str) ""#str""

 
#define _MT_ANNOTATION_REGISTER_FUNC_(funcType, externStr, funcName) static void funcName (void); \
__attribute__((used, section("__DATA," MTAnotationSection_SEL))) static const struct MTAnnotationStruct merge(MTAnnotationStruct_, funcName) = (struct MTAnnotationStruct){ \
(char *) MTAnotationSection_SEL, \
(char *) funcType, \
(char *) externStr, \
(MTAnnotation_Mach_O_Method) funcName, \
};\
\
static void funcName(void)



#define MTAnnotateRegister(funcType, externStr) \
class MTAnnotation; \
_MT_ANNOTATION_REGISTER_FUNC_(funcType, externStr, _UNIQUE_ID(MT_Annotate_regist_func_))





//---------------------------------

#if defined(__cplusplus)
}
#endif
static inline char* strdupNS(NSString* nss);

NS_ASSUME_NONNULL_BEGIN

@interface MTAnnotation : NSObject
@property (nonatomic,readonly) MTAnnotation_Mach_O_Method macho_O_method;  ///< 执行函数
@property (nonatomic,copy ,readonly) NSString *annotationType;  ///< 事件类型标识
@end

@interface MTAnnotate : NSObject
@property (nonatomic ,strong, readonly) NSDictionary<NSString *, NSArray<MTAnnotation *> *> *annotations; ///< mach_o注册的事件
@end

NS_ASSUME_NONNULL_END
