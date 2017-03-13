//
//  UIImage+LX.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/8/25.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "UIImage+LX.h"

@implementation UIImage (LX)

+ (UIImage *)getScaledImageWithImage:(UIImage *)image scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)getScaledImageWithImage:(UIImage *)image scaledRatio:(CGFloat)scaledRatio {
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    CGFloat scaledImageW = imageW;
    CGFloat scaledImageH = imageH;
    if (imageW > kScreen_WIDTH || imageH > kScreen_HEIGHT) {
        scaledImageW = imageW * scaledRatio;
        scaledImageH = imageH * scaledRatio;
    }
    return [UIImage getScaledImageWithImage:image scaleToSize:CGSizeMake(scaledImageW, scaledImageH)];
}

@end
