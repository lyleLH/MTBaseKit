///**
/**
MTPlayground
Created by: Tom.Liu on 2021/1/12
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

#import "UIViewController+MTToast.h"
#import <Toast/Toast.h>
#import "UIColor+MTExtension.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIViewController (MTToast)
- (void)mt_toastMessage:(NSString *)tips {
    [self mt_toastMessage:tips duration:2.0 position:kMTToastPositionType_Center];
}

- (void)mt_toastMessage:(NSString *)tips duration:(NSTimeInterval)duration   {
    [self mt_toastMessage:tips duration:duration position:kMTToastPositionType_Center];
}

- (void)mt_toastMessage:(NSString *)tips duration:(NSTimeInterval)duration  position:(kMTToastPositionType)position {
    id hudPosition;
    switch (position) {
        case kMTToastPositionType_Top:
            hudPosition =  CSToastPositionTop;
            break;
        case kMTToastPositionType_Center:
            hudPosition =  CSToastPositionCenter;
            break;
        case kMTToastPositionType_Bottom:
            hudPosition =  CSToastPositionBottom;
            break;
        default:
            break;
    }
    [self.view makeToast:tips duration:duration position:hudPosition ];
}



- (void)mt_toastDetailsTipWithTitle:(NSString *)title  content:(NSString *)content image:(NSString *)imageName duration:(NSTimeInterval)duration  position:(kMTToastPositionType)position completion:(void(^)(BOOL ))completion
{
    id hudPosition;
    switch (position) {
        case kMTToastPositionType_Top:
            hudPosition =  CSToastPositionTop;
            break;
        case kMTToastPositionType_Center:
            hudPosition =  CSToastPositionCenter;
            break;
        case kMTToastPositionType_Bottom:
            hudPosition =  CSToastPositionBottom;
            break;
        default:
            break;
    }
    CSToastStyle * style = [[CSToastStyle alloc] initWithDefaultStyle];
    style.maxWidthPercentage = 1.0;
    style.backgroundColor = [UIColor whiteColor];
    style.horizontalPadding = 10;
    style.imageSize = CGSizeMake(44, 44);
    style.titleColor = [UIColor mt_colorWithHex:0x141938];
    style.messageColor = [UIColor mt_colorWithHex:0xA4AEB7];
    [self.view makeToast:content duration:duration position:hudPosition title:title image:[UIImage imageNamed:imageName] style:style completion:completion];
}


 

@end
