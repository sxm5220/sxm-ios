//
//  NBProgressHUD.m
//  Ninebot
//
//  Created by tianliwei on 1/28/16.
//  Copyright © 2016 ninebot. All rights reserved.
//

#import "NBProgressHUD.h"

typedef enum {
    NBProgressHUDTypeDark,
    NBProgressHUDTypeLight
}NBProgressHUDType;

@implementation NBProgressHUD

+ (void)setHUDStyle:(NBProgressHUDType)type{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];//这句话是为了方便后面设置背景色
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];//这句话是为了设置蒙层防点击
    SVProgressHUD.minimumDismissTimeInterval = 1;
    if (type == NBProgressHUDTypeDark) {
        [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]];
        [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    }else if (type == NBProgressHUDTypeLight){
        [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
        [SVProgressHUD setForegroundColor:[UIColor blackColor]];
    }
}

+ (void)show{
    [NBProgressHUD setHUDStyle:NBProgressHUDTypeDark];
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading", nil)];
}

+ (void)showWithStatus:(NSString*)status{
    [NBProgressHUD setHUDStyle:NBProgressHUDTypeDark];
    [SVProgressHUD showWithStatus:status];
}

+ (void)showWarningWithStatus:(NSString *)string{
    [NBProgressHUD setHUDStyle:NBProgressHUDTypeDark];
    [SVProgressHUD showInfoWithStatus:string];
}

+ (void)showSuccessWithStatus:(NSString *)string{
    [NBProgressHUD setHUDStyle:NBProgressHUDTypeDark];
    [SVProgressHUD showSuccessWithStatus:string];
}

+ (void)showSuccessWithStatus_light:(NSString *)string{
    [NBProgressHUD setHUDStyle:NBProgressHUDTypeLight];
    [SVProgressHUD showSuccessWithStatus:string];
}

+ (void)showErrorWithStatus:(NSString *)string{
    if(string) {
        [NBProgressHUD setHUDStyle:NBProgressHUDTypeDark];
        [SVProgressHUD showErrorWithStatus:string];
    }
}

+ (void)showErrorWithNetwork:(NSError *)error{
    NSString *errorDescription = [self networkError:error];
    [self showErrorWithStatus:errorDescription];
}

+ (void)dismiss{
    [SVProgressHUD dismiss];
}

+ (void)showSuccessWithStatus_NCoin:(NSString *)string{
    [NBProgressHUD setHUDStyle:NBProgressHUDTypeDark];
    SVProgressHUD.minimumDismissTimeInterval = 3;
    [SVProgressHUD showSuccessWithStatus:string];
}

+ (NSString *)networkError:(NSError *)error{
    NSString *errorDescription;
    switch ([error code]) {
        case NSURLErrorCancelled://取消网络请求
            errorDescription = nil;
            break;
        case NSURLErrorBadServerResponse: //404 not found
            errorDescription = NSLocalizedString(@"NB_connect_Exception", nil);
            break;
        case NSURLErrorTimedOut://超时
            errorDescription = NSLocalizedString(@"s_outtimer", nil);
            break;
        case NSURLErrorNotConnectedToInternet://无网络
            errorDescription = NSLocalizedString(@"no_network", nil);
            break;
        default:
            errorDescription = NSLocalizedString(@"NB_connect_Exception", nil);
            break;
    }
    return errorDescription;
}
@end
