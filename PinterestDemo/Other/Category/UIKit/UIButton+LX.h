//
//  UIButton+LX.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/27.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LX)

- (void)lx_setImageWithURL:(NSURL *)url forState:(UIControlState)state;
- (void)lx_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;

- (void)lx_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state;
- (void)lx_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;

@end
