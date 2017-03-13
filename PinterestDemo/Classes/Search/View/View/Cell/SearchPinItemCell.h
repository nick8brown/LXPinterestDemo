//
//  SearchPinItemCell.h
//  PinterestDemo
//
//  Created by CACAO on 2017/3/13.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SearchPinItemCell_HEIGHT 176

@class SearchPinItem;

@interface SearchPinItemCell : UITableViewCell

// pin
@property (nonatomic, strong) SearchPinItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (instancetype)initWithTableView:(UITableView *)tableView;

@end
