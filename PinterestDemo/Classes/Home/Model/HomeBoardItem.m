//
//  HomeBoardItem.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/13.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "HomeBoardItem.h"

@implementation HomeBoardItem

- (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"desc":@"description",
             @"identifier":@"id"};
}

@end
