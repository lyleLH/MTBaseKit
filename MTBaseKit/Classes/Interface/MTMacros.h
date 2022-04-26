//
//  MTMacros.h
//
//
//  Created by Tom.Liu on 2021/3/5.
//  Copyright © 2021 Tom.Liu. All rights reserved.
//


#import <UIKit/UIKit.h>

#ifndef MTMacros_h
#define MTMacros_h

////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 机型适配相关 -- start
//MARK:-
////////////////////////////////////////////////////////////////


// ******** 界面相关 ********
#define kSCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)

#define kSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define kSCREEN_MAX_LENGTH (MAX(kSCREEN_WIDTH, kSCREEN_HEIGHT))

#define kSCREEN_MIN_LENGTH (MIN(kSCREEN_WIDTH, kSCREEN_HEIGHT))

#define kIS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kIS_IPHONE_4_OR_LESS (kIS_IPHONE && kSCREEN_MAX_LENGTH < 568.0)

#define kIS_IPHONE_5 (kIS_IPHONE && kSCREEN_MAX_LENGTH == 568.0)

#define kIS_IPHONE_6 (kIS_IPHONE && kSCREEN_MAX_LENGTH == 667.0)

#define kIS_IPHONE_6P (kIS_IPHONE && kSCREEN_MAX_LENGTH == 736.0)

#define kIS_iPhoneX (kIS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)

#define kIS_iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

#define kIS_iPhoneXsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是否IPHONE_X后的机型全面屏带安全区域
#define kIPHONE_X_LATER ([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom>0.0)
//状态栏的高度
#define kSTATUS_GAP (kIPHONE_X_LATER? 44 : 20)
//导航栏的高度
#define kNAVGATIONBAR_HEIGHT (kIPHONE_X_LATER? 88 : 64)
//底部安全距离
#define kIPhoneXSafeBottomMargin (kIPHONE_X_LATER ? 34.f : 0.f)


#define kTabBarHeight ((kIS_iPhoneX||kIS_iPhoneXR||kIS_iPhoneXsMax) ? 83.0 : 49.0)

#define kIPhoneXSafeArea (kNAVGATIONBAR_HEIGHT+kIPhoneXSafeBottomMargin)

#define kNavBarItemY (kIS_iPhoneX||kIS_iPhoneXR||kIS_iPhoneXsMax ? 24.0 : 0)

#define kIOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

#define kIOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#define kIOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define kIOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 机型适配相关 -- end
//MARK:-
////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 页面适配和字体适配工具-- start
//MARK:-
////////////////////////////////////////////////////////////////



#define FitFont(val,val1) ((kIS_IPHONE_5 || kIS_IPHONE_4_OR_LESS)?val:val1)
#define FitAllFont(val,val1,val2) ((kIS_IPHONE_5 || kIS_IPHONE_4_OR_LESS)?val:((kIS_IPHONE_6||kIS_iPhoneX)?val1:val2))



////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 页面适配和字体适配工具-- end
//MARK:-
////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////
//MARK:-
//MARK: Block相关
//MARK:-
////////////////////////////////////////////////////////////////



#define kWS(weakSelf) __weak __typeof(&*self)weakSelf = self;
#define kWeakSelf(type)   __weak __typeof(self) weakSelf = self;
#define kStrongSelf(type) __strong __typeof(weakSelf) self = weakSelf;


/* 常用的Block定义 */
typedef void(^MTVoidBlock)(void);
typedef void(^MTTapBtnBlock)(UIButton *);
typedef void(^MTIntegerBlock)(NSInteger value);
typedef void(^MTBoolBlock)(BOOL value);
typedef void(^MTArrayBlock)(NSArray *array);
typedef void(^MTStringBlock)(NSString *string);
typedef void(^MTStringValueBlock)(BOOL value,NSString *string);
typedef void(^MTTextFieldBlock)(UITextField *TF,NSString *str);


/* 线程操作宏 */
#define MT_ASYNC_MAIN(...) if ([NSThread isMainThread]) {\
                                __VA_ARGS__\
                            }else{\
                                dispatch_async(dispatch_get_main_queue(), ^{\
                                    __VA_ARGS__\
                                });\
                            }
#define MT_ASYNC_GLOBAL(...)  dispatch_async(dispatch_get_global_queue(0, 0), ^{\
                                __VA_ARGS__\
                              });


////////////////////////////////////////////////////////////////
//MARK:-
//MARK: Block相关-- end
//MARK:-
////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////
//MARK:-
//MARK: LOG 相关
//MARK:-
////////////////////////////////////////////////////////////////




#ifdef DEBUG
#define MTLog(s, ... ) NSLog( @"\n -->[%@ in line %d %s]--> \n\n\n\n      %@\n\n\n\n <---", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define MTLog(s, ... )
#endif

#ifdef DEBUG
#define MT_DEBUG_CODE(...) do{\
                                __VA_ARGS__\
                            }while (0);
#else
#define MT_DEBUG_CODE(...)
#endif


////////////////////////////////////////////////////////////////
//MARK:-
//MARK: LOG 相关 -- end
//MARK:-
////////////////////////////////////////////////////////////////




#endif /* MTMacros_h */
