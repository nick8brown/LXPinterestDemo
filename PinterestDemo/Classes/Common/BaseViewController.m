//
//  BaseViewController.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/25.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation HZGAlertHandler

+ (instancetype)handlerWithTitle:(NSString *)title alertAction:(AlertAction)alertAction {
    HZGAlertHandler *handler = [[HZGAlertHandler alloc] init];
    handler.title = title;
    handler.alertAction = alertAction;
    return handler;
}

@end

@implementation BaseViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 如果没有这一句，push时会有停留的bug
//    self.view.backgroundColor = SYS_White_Color;
    
    // 初始化导航栏
    [self setupNavBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private func
// 通过xib创建一个控制器
+ (instancetype)nibController {
    return [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

+ (instancetype)storyboardController {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

#pragma mark - 初始化导航栏
- (void)setupNavBar {
    // 子类重写
}

// 初始化backNavBarView
- (void)setupBackNavBarView {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 25, 22);
    [btn setImage:ImageNamed(@"return") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(returnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *returnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItems = @[returnItem];
}

// 初始化closeNavBarView
- (void)setupCloseNavBarView {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 20, 20);
    [btn setImage:ImageNamed(@"close") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItems = @[closeItem];
}

#pragma mark - 弹框
- (void)alertWithMessage:(NSString *)message {
    [self alertWithTitle:@"提示" message:message];
}

- (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [self addActionWithAlertController:alertController Title:@"好的" style:UIAlertActionStyleDefault];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)addActionWithAlertController:(UIAlertController *)alertController Title:(NSString *)title style:(UIAlertActionStyle)style {
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:nil];
    [alertController addAction:action];
}

- (void)alert_handlerWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *))handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:defaultAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)alert_handlerWithTitle:(NSString *)title message:(NSString *)message handlers:(NSArray *)handlers {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < handlers.count; i++) {
        HZGAlertHandler *handler = handlers[i];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:handler.title style:UIAlertActionStyleDefault handler:handler.alertAction];
        [alertController addAction:defaultAction];
    }
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)actionSheetWithTitle:(NSString *)title message:(NSString *)message handlers:(NSArray *)handlers {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < handlers.count; i++) {
        HZGAlertHandler *handler = handlers[i];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:handler.title style:UIAlertActionStyleDefault handler:handler.alertAction];
        [alertController addAction:defaultAction];
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (NSArray *)setupActionSheetHandlerForPhoto {
    HZGAlertHandler *handler1 = [HZGAlertHandler handlerWithTitle:@"拍照" alertAction:^(UIAlertAction *action) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self alertWithTitle:@"未获得授权使用摄像头" message:@"请在iOS设置->隐私->相机中打开"];
        } else {
            [self presentViewController:[self setupImagePickerController:UIImagePickerControllerSourceTypeCamera] animated:YES completion:nil];
        }
    }];
    
    HZGAlertHandler *handler2 = [HZGAlertHandler handlerWithTitle:@"从手机相册选择" alertAction:^(UIAlertAction *action) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            [self alertWithTitle:@"未获得授权使用相册" message:@"请在iOS设置->隐私->照片中打开"];
        } else {
            [self presentViewController:[self setupImagePickerController:UIImagePickerControllerSourceTypePhotoLibrary] animated:YES completion:nil];
        }
    }];
    
    return @[handler1, handler2];
}

- (UIImagePickerController *)setupImagePickerController:(UIImagePickerControllerSourceType)sourceType {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = sourceType;
    imagePickerController.delegate = self;
    return imagePickerController;
}

#pragma mark - 监听按钮点击事件
// 返回
- (void)returnBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

// 关闭
- (void)closeBtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
