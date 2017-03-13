//
//  HZGProgressHUDTool.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/5/22.
//  Copyright © 2016年 KFM. All rights reserved.
//  封装整个项目的ProgressHUD处理

#import <Foundation/Foundation.h>
#import "MBProgressHUD+MJ.h"
#import "SVProgressHUD.h"

@interface HZGProgressHUDTool : NSObject

// MBProgressHUD+MJ
+ (void)lx_showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)lx_showError:(NSString *)error toView:(UIView *)view;
+ (void)lx_showSuccess:(NSString *)success;
+ (void)lx_showError:(NSString *)error;

+ (MBProgressHUD *)lx_showMessage:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)lx_showMessage:(NSString *)message;

+ (void)lx_hideHUDForView:(UIView *)view;
+ (void)lx_hideHUD;

+ (void)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showMessage:(NSString *)message;

// SVProgressHUD
+ (void)showLoadingHUD;

+ (void)dismissLoadingHUD;
+ (void)dismissLoadingHUDWithDelay:(NSTimeInterval)delay;
+ (void)dismissLoadingHUDWithCompletion:(SVProgressHUDDismissCompletion)completion;
+ (void)dismissLoadingHUDWithDelay:(NSTimeInterval)delay completion:(SVProgressHUDDismissCompletion)completion;

+ (void)showLoadingErrorWithStatus:(NSString*)status;

@end
