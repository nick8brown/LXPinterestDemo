//
//  HZGHttpTool.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/26.
//  Copyright © 2016年 KFM. All rights reserved.
//  封装整个项目的GET\POST请求

#import <Foundation/Foundation.h>

@interface HZGHttpTool : NSObject

// 发送一个GET请求
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

// 发送一个POST请求
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

@end
