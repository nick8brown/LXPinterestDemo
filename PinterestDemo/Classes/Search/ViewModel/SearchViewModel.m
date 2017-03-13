//
//  SearchViewModel.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/13.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "SearchViewModel.h"
#import "SearchPinItem.h"

@implementation SearchViewModel

#pragma mark - 数据请求
// 加载Pins数据
- (void)loadSearchPinsDataWithParams:(NSDictionary *)params {
    // 1.创建URL
    AppLog(@"-----【Search】-----【PinsURL】-----【%@】", APP_SEARCH_PINS_URL);
    
    // 2.发送请求
    [HZGHttpTool getWithURL:APP_SEARCH_PINS_URL params:params success:^(id json) {
        NSDictionary *dict = (NSDictionary *)json;
        if (!TrueDictionary(dict) || !TrueArray(dict[@"data"])) {
            AppLog(@"服务器返回错误，未获取到json对象");
            self.errorBlock(-100);
            return;
        }
        
        // 处理数据
        [self handleJSONDict:dict];
    } failure:^(NSError *error) {
        self.failureBlock(error);
    }];
}

#pragma mark - 数据处理
- (void)handleJSONDict:(NSDictionary *)dict {
    self.searchPinsItems = [SearchPinItem objectArrayWithKeyValuesArray:dict[@"data"]];

    for (int i = 0; i < self.searchPinsItems.count; i++) {
        SearchPinItem *item = self.searchPinsItems[i];
        NSDictionary *pin = dict[@"data"][i];
        item.image_url = pin[@"image"][@"original"][@"url"];
    }
    
    self.successBlock(self.searchPinsItems);
}

@end
