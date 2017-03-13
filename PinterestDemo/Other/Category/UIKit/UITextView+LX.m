//
//  UITextView+LX.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/8/30.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "UITextView+LX.h"

@implementation UITextView (LX)

+ (void)setPlaceholderWithPlaceholderLabel:(UILabel *)placeholderLabel forTextView:(UITextView *)textView placeholder:(NSString *)placeholder {
    placeholderLabel.text = (!textView.text.length) ? placeholder : @"";
}

@end
