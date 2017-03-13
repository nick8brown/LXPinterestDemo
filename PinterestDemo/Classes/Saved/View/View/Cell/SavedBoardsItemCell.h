//
//  SavedBoardsItemCell.h
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SavedBoardsItemCell_HEIGHT 134

@class PDKBoard;

@interface SavedBoardsItemCell : UITableViewCell

// board
@property (nonatomic, strong) PDKBoard *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (instancetype)initWithTableView:(UITableView *)tableView;

@end
