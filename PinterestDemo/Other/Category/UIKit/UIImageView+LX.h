//
//  UIImageView+LX.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/27.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LX)

- (void)lx_setImageWithURL:(NSURL *)url;
- (void)lx_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

@end
