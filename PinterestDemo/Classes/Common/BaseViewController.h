//
//  BaseViewController.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/25.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertAction)(UIAlertAction *action);

@interface HZGAlertHandler : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) AlertAction alertAction;

+ (instancetype)handlerWithTitle:(NSString *)title alertAction:(AlertAction)alertAction;

@end


@interface BaseViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

// 通过xib创建一个控制器
+ (instancetype)nibController;
+ (instancetype)storyboardController;

// 初始化导航栏
- (void)setupNavBar;

- (void)setupBackNavBarView;
- (void)setupCloseNavBarView;

// 弹框
- (void)alertWithMessage:(NSString *)message;
- (void)alertWithTitle:(NSString *)title message:(NSString *)message;

- (void)alert_handlerWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *action))handler;
- (void)alert_handlerWithTitle:(NSString *)title message:(NSString *)message handlers:(NSArray *)handlers;

- (void)actionSheetWithTitle:(NSString *)title message:(NSString *)message handlers:(NSArray *)handlers;
- (NSArray *)setupActionSheetHandlerForPhoto;

@end
