//
//  SearchViewModel.h
//  PinterestDemo
//
//  Created by CACAO on 2017/3/13.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "BaseViewModel.h"

@interface SearchViewModel : BaseViewModel

// 数据源（Pins）
@property (nonatomic, strong) NSArray *searchPinsItems;

// 加载Pins数据
- (void)loadSearchPinsDataWithParams:(NSDictionary *)params;

@end
