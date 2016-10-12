//
//  NBProgressHUD.h
//  Ninebot
//
//  Created by tianliwei on 1/28/16.
//  Copyright © 2016 ninebot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pods/SVProgressHUD/SVProgressHUD/SVProgressHUD.h"

@interface NBProgressHUD : NSObject

+ (void)show;//不会自动消失
+ (void)showWithStatus:(NSString*)status;//不会自动消失
+ (void)showWarningWithStatus:(NSString *)string;//警告之类的提示
+ (void)showSuccessWithStatus:(NSString *)string;//成功的提示
+ (void)showSuccessWithStatus_light:(NSString *)string;
+ (void)showErrorWithStatus:(NSString *)string;//失败的提示
+ (void)showErrorWithNetwork:(NSError *)error;//网络错误
+ (void)dismiss;//对于不自动消失的，需要调用这个来使其消失
+ (void)showSuccessWithStatus_NCoin:(NSString *)string;
@end
