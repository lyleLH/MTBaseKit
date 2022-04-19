//
//  MTDeviceUtility.m
//   
//
//  Created by Tom.Liu on 2021/3/5.
//  Copyright © 2021 Tom.Liu. All rights reserved.
//

#import "MTDeviceUtility.h"

@implementation MTDeviceUtility


+ (int)fittedWidth:(CGFloat)val{
    if (kIS_IPHONE_6 || kIS_iPhoneX ) {
        return val;
    } else if (kIS_IPHONE_5 || kIS_IPHONE_4_OR_LESS){
        return (int) (val*320/375);
    } else {
        return (int)(val*414/375);  //XR XSMAX PLUS 的width都为 414 pt
    }
}

+ (int)fittedHeight:(CGFloat)val{
    if(kIS_IPHONE_4_OR_LESS){
        return (int) (val*480/667);
    } else if (kIS_IPHONE_5){
        return (int) (val*568/667);
    } else if (kIS_IPHONE_6){
        return val;
    } else if (kIS_IPHONE_6P){
        return (int) (val*736/667);
    } else if (kIS_iPhoneX){
        return (int) (val*(812-34)/667);
    } else if (kIS_iPhoneXR){
        return (int) (val*(896-34)/667);
    }else{
        return (int) (val*(896-34)/667);
    }
}

+ (BOOL)isIphoneXLater{
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom>0.0;
    }
    return NO;
}


@end
