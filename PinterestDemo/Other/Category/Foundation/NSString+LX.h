//
//  NSString+LX.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/5/16.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import <Foundation/Foundation.h>

#define YEAR_MONTH_DAY @"yyyy-MM-dd"
#define YEAR_MONTH_DAY_HOUR_MINUTE @"yyyy-MM-dd HH:mm"
#define YEAR_MONTH_DAY_HOUR_MINUTE_SECOND @"yyyy-MM-dd HH:mm:ss"

@interface NSString (LX)

// 是否为NSString类
+ (NSString *)isIfNullWithString:(id)str;
// 字符串拼接符号
+ (NSString *)configLabelWithData:(NSArray *)data appendString:(NSString *)appendString;

// 得到格式化当前时间
+ (NSString *)getCurrentTimeWithDateFormat:(NSString *)dateFormat;
+ (NSDate *)getCurrentDateWithDateFormat:(NSString *)dateFormat;

// 得到格式化时间（通过NSDate）
+ (NSString *)getFormatterDateWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat;
+ (NSDate *)getDateWithFormatterDate:(NSDate *)date dateFormat:(NSString *)dateFormat;

// 得到格式化时间（通过时间戳）
+ (NSString *)getFormatterDateWithTime:(NSString *)time dateFormat:(NSString *)dateFormat;
+ (NSDate *)getDateWithTime:(NSString *)time dateFormat:(NSString *)dateFormat;

// 得到字符串中的数字
+ (int)getNumberWithString:(NSString *)str;
+ (int)getNumberWithStringByScanner:(NSString *)str;

// 自适应
- (CGFloat)heightWithFont:(UIFont *)font withinSize:(CGSize)size;
- (CGFloat)widthWithFont:(UIFont *)font;

// 富文本
+ (NSAttributedString *)getFontAttributedTextWithString:(NSString *)string value:(UIFont *)value rangeString:(NSString *)rangeString;
+ (NSAttributedString *)getForegroundColorAttributedTextWithString:(NSString *)string value:(UIColor *)value rangeString:(NSString *)rangeString;

@end
