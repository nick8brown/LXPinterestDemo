//
//  HomeViewModel.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/13.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeBoardItem.h"

@implementation HomeViewModel

#pragma mark - lazy load
- (NSMutableArray *)boardsPinsItems {
    if (!_boardsPinsItems) {
        _boardsPinsItems = [NSMutableArray array];
    }
    return _boardsPinsItems;
}

#pragma mark - 数据请求
// 加载Boards数据
- (void)loadHomeBoardsDataWithParams:(NSDictionary *)params {
    // 1.创建URL
    AppLog(@"-----【Home】-----【BoardsURL】-----【%@】", APP_HOME_BOARDS_URL);
    
    // 2.发送请求
    [HZGHttpTool getWithURL:APP_HOME_BOARDS_URL params:params success:^(id json) {
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

- (void)loadBoardsPinsDataWithBoardId:(NSString *)boardId {
    [[PDKClient sharedInstance] getBoardPins:boardId fields:[NSSet setWithArray:@[@"id", @"image", @"note"]] withSuccess:^(PDKResponseObject *responseObject) {
        [self.boardsPinsItems addObjectsFromArray:responseObject.pins];
        
        self.successBlock(self.boardsPinsItems);
    } andFailure:^(NSError *error) {
        self.failureBlock(error);
    }];
}

#pragma mark - 数据处理
- (void)handleJSONDict:(NSDictionary *)dict {
    self.homeBoardsItems = [NSMutableArray arrayWithArray:[HomeBoardItem objectArrayWithKeyValuesArray:dict[@"data"]]];
    
    for (HomeBoardItem *item in self.homeBoardsItems) {
        [self loadBoardsPinsDataWithBoardId:item.identifier];
    }
}

@end
