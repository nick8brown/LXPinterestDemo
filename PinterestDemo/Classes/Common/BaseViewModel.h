//
//  BaseViewModel.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/7/27.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id data);
typedef void(^ErrorBlock)(NSInteger code);
typedef void(^FailureBlock)(NSError *error);

@interface BaseViewModel : NSObject

@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) ErrorBlock errorBlock;
@property (nonatomic, copy) FailureBlock failureBlock;

+ (instancetype)viewModel;
- (instancetype)initWithSuccessBlock:(SuccessBlock)successBlock errorBlock:(ErrorBlock)errorBlock failureBlock:(FailureBlock)failureBlock;

@end
