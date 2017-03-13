//
//  UIColor+LX.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/7/4.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "UIColor+LX.h"

@implementation UIColor (LX)

+ (instancetype)randomColor {
    static BOOL seeded = NO;
    if (!seeded) {
        seeded = YES;
        time(NULL);
    }
    CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

@end
