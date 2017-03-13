//
//  BaseViewModel.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/7/27.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

+ (instancetype)viewModel {
    return [[[self class] alloc] init];
}

- (instancetype)initWithSuccessBlock:(SuccessBlock)successBlock errorBlock:(ErrorBlock)errorBlock failureBlock:(FailureBlock)failureBlock {
    self = [super init];
    if (self) {
        _successBlock = successBlock;
        _errorBlock = errorBlock;
        _failureBlock = failureBlock;
    }
    return self;
}

@end
