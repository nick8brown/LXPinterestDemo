//
//  UIImage+LX.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/8/25.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LX)

+ (UIImage *)getScaledImageWithImage:(UIImage *)image scaleToSize:(CGSize)size;
+ (UIImage *)getScaledImageWithImage:(UIImage *)image scaledRatio:(CGFloat)scaledRatio;

@end
