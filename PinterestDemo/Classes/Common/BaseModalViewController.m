//
//  BaseModalViewController.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/5/27.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "BaseModalViewController.h"

@interface BaseModalViewController ()

@end

@implementation BaseModalViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 初始化导航栏
- (void)setupNavBar {
    // 子类重写
    
    // 初始化closeNavBarView
    [self setupCloseNavBarView];
}

@end
