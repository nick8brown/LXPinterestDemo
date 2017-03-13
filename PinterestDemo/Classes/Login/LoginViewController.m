//
//  LoginViewController.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/11.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "LoginViewController.h"
#import "TabBarController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [HZGProgressHUDTool showLoadingHUD];
    
    __weak __typeof(self)weakSelf = self;

    [[PDKClient sharedInstance] silentlyAuthenticateWithSuccess:^(PDKResponseObject *responseObject) {
        [HZGProgressHUDTool dismissLoadingHUD];

        if ([PDKClient sharedInstance].authorized) {
            [weakSelf presentViewController:[TabBarController storyboardController] animated:NO completion:nil];
        }
    } andFailure:^(NSError *error) {
        [HZGProgressHUDTool dismissLoadingHUD];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 使用Pinterest登录
- (IBAction)logInWithPinterest:(UIButton *)sender {
    __weak __typeof(self)weakSelf = self;
    
    [[PDKClient sharedInstance] authenticateWithPermissions:@[PDKClientReadPublicPermissions,
                                                              PDKClientWritePublicPermissions,
                                                              PDKClientReadRelationshipsPermissions,
                                                              PDKClientWriteRelationshipsPermissions] withSuccess:^(PDKResponseObject *responseObject) {
        [HZGProgressHUDTool lx_showSuccess:@"登录成功"];
                                                                  
        [weakSelf presentViewController:[TabBarController storyboardController] animated:NO completion:nil];
    } andFailure:^(NSError *error) {
        [HZGProgressHUDTool lx_showError:@"授权失败"];
    }];
}

#pragma mark - 登录
- (IBAction)logIn:(UIButton *)sender {
}

#pragma mark - 键盘\触摸屏
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
