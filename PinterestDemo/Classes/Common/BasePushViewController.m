//
//  BasePushViewController.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/5/27.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "BasePushViewController.h"

@interface BasePushViewController ()

@end

@implementation BasePushViewController

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
    
    // 初始化backNavBarView
    [self setupBackNavBarView];
}

@end
