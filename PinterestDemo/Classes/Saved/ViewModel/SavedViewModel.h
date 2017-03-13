//
//  SavedViewModel.h
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "BaseViewModel.h"
#import "SavedUserItem.h"

@interface SavedViewModel : BaseViewModel

// 用户
@property (nonatomic, strong) SavedUserItem *savedUserItem;

// 数据源（Boards）
@property (nonatomic, strong) NSMutableArray *savedBoardsItems;
@property (nonatomic, strong) NSMutableArray *boardsPinsItems;

// 数据源（Pins）
@property (nonatomic, strong) NSMutableArray *savedPinsItems;

// 数据源（Liked）
@property (nonatomic, strong) NSMutableArray *savedLikedItems;

// 加载用户数据
- (void)loadSavedUserDataWithParams:(NSDictionary *)params;

// 加载Boards数据
- (void)loadSavedBoardsData;
- (void)loadBoardsPinsDataWithBoard:(PDKBoard *)board;

// 加载Pins数据
- (void)loadSavedPinsData;

// 加载Liked数据
- (void)loadSavedLikedData;

@end
