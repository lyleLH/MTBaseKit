//
//  DGPassengerFontUtility.m
//  DGPassenger
//
//  Created by Tom.Liu on 2021/3/5.
//  Copyright © 2021 Tom.Liu. All rights reserved.
//

#import "DGPassengerFontUtility.h"

enum {
    _FT_STYLE_SYS_NORMAL,
    _FT_STYLE_SYS_BOLD,
    _FT_STYLE_SYS_ITALIC,
    
    _FT_STYLE_LATO_HALF_REGULAR,
    _FT_STYLE_MISO_HALF_REGULAR,
    
    _FT_STYLE_BARIOL_REGULAR,
    _FT_STYLE_BARIOL_LIGHT,
    
    _FT_STYLE_NOTO_REGULAR,
    _FT_STYLE_NOTO_MEDIUM,
    _FT_STYLE_NOTO_DEMI,
    _FT_STYLE_NOTO_BOLD,
};

@implementation DGPassengerFontUtility

+ (UIFont *)fontWithDescription:(NSString *)ftDesc {
    NSArray *ary = [ftDesc componentsSeparatedByString:@","];
    if (ary && ary.count>0) {
        float ftSize = ((NSString*)ary[ary.count>1]).floatValue;
        int   ftStyle = _FT_STYLE_SYS_NORMAL;
        if (ary.count > 1) {
            static NSDictionary *dict;
            static dispatch_once_t once;
            dispatch_once(&once, ^{
                dict =
                @{
                  @"bold" : @(_FT_STYLE_SYS_BOLD),
                  @"italic" : @(_FT_STYLE_SYS_ITALIC),
                  @"lato" : @(_FT_STYLE_LATO_HALF_REGULAR),
                  @"miso" : @(_FT_STYLE_MISO_HALF_REGULAR),
                  @"bariol" : @(_FT_STYLE_BARIOL_REGULAR),
                  @"bariol_light" : @(_FT_STYLE_BARIOL_LIGHT),
                  @"noto_regular" : @(_FT_STYLE_NOTO_REGULAR),
                  @"noto_medium" : @(_FT_STYLE_NOTO_MEDIUM),
                  @"noto_demi" : @(_FT_STYLE_NOTO_DEMI),
                  @"noto_bold" : @(_FT_STYLE_NOTO_BOLD)
                  };
            });
            NSNumber *n = dict[ary[0]];
            if (n) {
                ftStyle = [n intValue];
            }
        }
        //NSLog(@"_newFont: [%f,%d]", ftSize, ftStyle);
        switch (ftStyle) {
                case _FT_STYLE_SYS_NORMAL: return [UIFont systemFontOfSize:ftSize];
                case _FT_STYLE_SYS_BOLD:   return [UIFont boldSystemFontOfSize:ftSize];
                case _FT_STYLE_SYS_ITALIC: return [UIFont italicSystemFontOfSize:ftSize];
                
                case _FT_STYLE_LATO_HALF_REGULAR: return [UIFont fontWithName:@"Lato" size:ftSize];
                case _FT_STYLE_MISO_HALF_REGULAR: return [UIFont fontWithName:@"Miso" size:ftSize];
                
                case _FT_STYLE_BARIOL_REGULAR: return [UIFont fontWithName:@"Bariol-Regular" size:ftSize];
                case _FT_STYLE_BARIOL_LIGHT: return [UIFont fontWithName:@"Bariol-Light" size:ftSize];
//                case _FT_STYLE_NOTO_REGULAR: return [UIFont fontWithName:@"NotoSansHans-Regular" size:ftSize];
//                case _FT_STYLE_NOTO_MEDIUM: return [UIFont fontWithName:@"NotoSansHans-Medium" size:ftSize];
//                case _FT_STYLE_NOTO_DEMI: return [UIFont fontWithName:@"NotoSansHans-DemiLight" size:ftSize];
                
            case _FT_STYLE_NOTO_REGULAR: return [UIFont fontWithName:@"Thonburi" size:ftSize];
            case _FT_STYLE_NOTO_MEDIUM:  return [UIFont fontWithName:@"Avenir-Medium" size:ftSize];
            case _FT_STYLE_NOTO_DEMI:    return [UIFont fontWithName:@"Thonburi-Light" size:ftSize];
            case _FT_STYLE_NOTO_BOLD:    return [UIFont fontWithName:@"Thonburi-Bold" size:ftSize];
            default: {
                NSLog(@"!!! Fail to create font: %@", ftDesc);
            }
        }
    }
    return nil;
}

@end
