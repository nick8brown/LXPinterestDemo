//
//  HZGProgressHUDTool.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/5/22.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "HZGProgressHUDTool.h"

@implementation HZGProgressHUDTool

#pragma mark - MBProgressHUD+MJ
+ (void)lx_showSuccess:(NSString *)success toView:(UIView *)view {
    [MBProgressHUD showSuccess:success toView:view];
}

+ (void)lx_showError:(NSString *)error toView:(UIView *)view {
    [MBProgressHUD showError:error toView:view];
}

+ (void)lx_showSuccess:(NSString *)success {
    [MBProgressHUD showSuccess:success];
}

+ (void)lx_showError:(NSString *)error {
    [MBProgressHUD showError:error];
}

+ (MBProgressHUD *)lx_showMessage:(NSString *)message toView:(UIView *)view {
    return [MBProgressHUD showMessage:message toView:view];
}

+ (MBProgressHUD *)lx_showMessage:(NSString *)message {
    return [MBProgressHUD showMessage:message];
}

+ (void)lx_hideHUDForView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view];
}

+ (void)lx_hideHUD {
    [MBProgressHUD hideHUD];
}

+ (void)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}

+ (void)showMessage:(NSString *)message {
    [self showMessage:message toView:nil];
}

#pragma mark - SVProgressHUD
static NSTimeInterval delay = 0.0;
+ (void)showLoadingHUD {
    delay = 0.0;
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD show];
    
    [[self alloc] performSelector:@selector(updateDelay) withObject:nil afterDelay:0.5];
}

- (void)updateDelay {
    delay += 1.0;
    if (delay < 3.0) {
        [self performSelector:@selector(updateDelay) withObject:nil afterDelay:0.5];
    } else {
        [SVProgressHUD dismiss];
    }
}

+ (void)dismissLoadingHUD {
    [SVProgressHUD dismiss];
}

+ (void)dismissLoadingHUDWithDelay:(NSTimeInterval)delay {
    [SVProgressHUD dismissWithDelay:delay];
}

+ (void)dismissLoadingHUDWithCompletion:(SVProgressHUDDismissCompletion)completion {
    [SVProgressHUD dismissWithCompletion:completion];
}

+ (void)dismissLoadingHUDWithDelay:(NSTimeInterval)delay completion:(SVProgressHUDDismissCompletion)completion {
    [SVProgressHUD dismissWithDelay:delay completion:completion];
}

+ (void)showLoadingErrorWithStatus:(NSString*)status {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    [SVProgressHUD showErrorWithStatus:status];
}

@end
