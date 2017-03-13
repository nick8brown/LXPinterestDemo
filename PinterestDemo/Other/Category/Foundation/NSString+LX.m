//
//  NSString+LX.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/5/16.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "NSString+LX.h"

@implementation NSString (LX)

// 是否为NSString类
+ (NSString *)isIfNullWithString:(id)str {
    if (![str isKindOfClass:[NSString class]]) {
        return @"";
    }
    return str;
}

// 字符串拼接符号
+ (NSString *)configLabelWithData:(NSArray *)data appendString:(NSString *)appendString {
    NSMutableString *mStr = [NSMutableString stringWithString:@""];
    int index = 0;
    for (int i = 0; i < data.count; i++) {
        NSString *str = data[i];
        if (![str isEqualToString:@""]) {
            index = i;
            break;
        }
    }
    for (int i = index; i < data.count; i++) {
        NSString *str = data[i];
        if (![str isEqualToString:@""]) {
            if (![mStr isEqualToString:@""]) {
                [mStr appendString:appendString];
            }
            [mStr appendString:str];
        }
    }
    return mStr;
}

#pragma mark - 得到格式化当前时间
+ (NSString *)getCurrentTimeWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (NSDate *)getCurrentDateWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter dateFromString:[dateFormatter stringFromDate:[NSDate date]]];
}

#pragma mark - 得到格式化时间（通过NSDate）
+ (NSString *)getFormatterDateWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)getDateWithFormatterDate:(NSDate *)date dateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter dateFromString:[dateFormatter stringFromDate:date]];
}

#pragma mark - 得到格式化时间（通过时间戳）
+ (NSString *)getFormatterDateWithTime:(NSString *)time dateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[time doubleValue]]];
}

+ (NSDate *)getDateWithTime:(NSString *)time dateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter dateFromString:[dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[time doubleValue]]]];
}

#pragma mark - 得到字符串中的数字
+ (int)getNumberWithString:(NSString *)str {
    NSCharacterSet *set = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    return [[str stringByTrimmingCharactersInSet:set] intValue];
}

+ (int)getNumberWithStringByScanner:(NSString *)str {
    NSScanner *scanner = [NSScanner scannerWithString:str];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    int number;
    [scanner scanInt:&number];
    return number;
}

#pragma mark - 自适应
- (CGFloat)heightWithFont:(UIFont *)font withinSize:(CGSize)size {
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    return ceil(rect.size.height);
}

- (CGFloat)widthWithFont:(UIFont *)font {
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, font.pointSize)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    return ceil(rect.size.width);
}

#pragma mark - 富文本
+ (NSAttributedString *)getFontAttributedTextWithString:(NSString *)string value:(UIFont *)value rangeString:(NSString *)rangeString {
    NSMutableAttributedString *attrs = [[NSMutableAttributedString alloc] initWithString:string];
    [attrs addAttribute:NSFontAttributeName value:value range:[string rangeOfString:rangeString]];
    return attrs;
}

+ (NSAttributedString *)getForegroundColorAttributedTextWithString:(NSString *)string value:(UIColor *)value rangeString:(NSString *)rangeString {
    NSMutableAttributedString *attrs = [[NSMutableAttributedString alloc] initWithString:string];
    [attrs addAttribute:NSForegroundColorAttributeName value:value range:[string rangeOfString:rangeString]];
    return attrs;
}

@end
