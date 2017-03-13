//
//  HomeViewModel.h
//  PinterestDemo
//
//  Created by CACAO on 2017/3/13.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeViewModel : BaseViewModel

// 数据源（Boards）
@property (nonatomic, strong) NSMutableArray *homeBoardsItems;
@property (nonatomic, strong) NSMutableArray *boardsPinsItems;

// 加载Boards数据
- (void)loadHomeBoardsDataWithParams:(NSDictionary *)params;
- (void)loadBoardsPinsDataWithBoardId:(NSString *)boardId;

@end
