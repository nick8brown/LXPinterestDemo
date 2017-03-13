//
//  UIButton+LX.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/27.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "UIButton+LX.h"
#import "UIButton+WebCache.h"

@implementation UIButton (LX)

- (void)lx_setImageWithURL:(NSURL *)url forState:(UIControlState)state {
    [self sd_setImageWithURL:url forState:state];
}

- (void)lx_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder {
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder];
}

- (void)lx_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state {
    [self sd_setBackgroundImageWithURL:url forState:state];
}

- (void)lx_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder {
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder];
}

@end
