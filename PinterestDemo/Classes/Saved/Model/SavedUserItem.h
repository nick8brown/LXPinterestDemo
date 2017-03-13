//
//  SavedUserItem.h
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavedUserItem : NSObject

@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *first_name;
@property (nonatomic, copy) NSString *last_name;
@property (nonatomic, strong) NSString *image_url;
@property (nonatomic, strong) NSNumber *counts_following;
@property (nonatomic, strong) NSNumber *counts_followers;

@end
