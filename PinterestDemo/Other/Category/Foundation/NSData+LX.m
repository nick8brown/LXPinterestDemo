//
//  NSData+LX.m
//  HZGAPP
//
//  Created by 曾令轩 on 16/8/26.
//  Copyright © 2016年 KFM. All rights reserved.
//

#import "NSData+LX.h"

@implementation NSData (LX)

+ (NSData *)getImageDataWithImage:(UIImage *)image {
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    if (data.length > 100*1024) { // 大于100K
        if (data.length > 2*1024*1024) { // 2M以上
            data = UIImageJPEGRepresentation(image, 0.000001);
        } else if (data.length > 1*1024*1024) { // 1~2M
            data = UIImageJPEGRepresentation(image, 0.1);
        } else if (data.length > 512*1024) { // 0.5~1M
            data = UIImageJPEGRepresentation(image, 0.5);
        } else if (data.length > 256*1024) { // 0.25~0.5M
            data = UIImageJPEGRepresentation(image, 0.9);
        }
    }
    return data;
}

@end
