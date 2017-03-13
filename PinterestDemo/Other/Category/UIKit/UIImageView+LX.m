//
//  UIImageView+LX.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/27.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "UIImageView+LX.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (LX)

- (void)lx_setImageWithURL:(NSURL *)url {
    [self sd_setImageWithURL:url];
}

- (void)lx_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder];
}

@end
