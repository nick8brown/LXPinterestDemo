//
//  SavedViewModel.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "SavedViewModel.h"

@implementation SavedViewModel

#pragma mark - 数据请求
// 加载用户数据
- (void)loadSavedUserDataWithParams:(NSDictionary *)params {
    // 1.创建URL
    AppLog(@"-----【Saved】-----【用户URL】-----【%@】", APP_SAVED_USER_URL);

    // 2.发送请求
    [HZGHttpTool getWithURL:APP_SAVED_USER_URL params:params success:^(id json) {
        NSDictionary *dict = (NSDictionary *)json;
        if (!TrueDictionary(dict) || !TrueDictionary(dict[@"data"])) {
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

// 加载Boards数据
- (void)loadSavedBoardsData {
    [[PDKClient sharedInstance] getAuthenticatedUserBoardsWithFields:[NSSet setWithArray:@[@"id", @"image", @"description", @"name", @"privacy"]] success:^(PDKResponseObject *responseObject) {
        self.savedBoardsItems = [NSMutableArray arrayWithArray:responseObject.boards];
        
        self.successBlock(self.savedBoardsItems);
    } andFailure:^(NSError *error) {
        self.failureBlock(error);
    }];
}

- (void)loadBoardsPinsDataWithBoard:(PDKBoard *)board {
    [[PDKClient sharedInstance] getBoardPins:board.identifier fields:[NSSet setWithArray:@[@"id", @"image", @"note"]] withSuccess:^(PDKResponseObject *responseObject) {
        self.boardsPinsItems = [NSMutableArray arrayWithArray:responseObject.pins];
        
        self.successBlock(self.boardsPinsItems);
    } andFailure:^(NSError *error) {
        self.failureBlock(error);
    }];
}

// 加载Pins数据
- (void)loadSavedPinsData {
    [[PDKClient sharedInstance] getAuthenticatedUserPinsWithFields:[NSSet setWithArray:@[@"id", @"image", @"note"]] success:^(PDKResponseObject *responseObject) {
        self.savedPinsItems = [NSMutableArray arrayWithArray:responseObject.pins];
        
        self.successBlock(self.savedPinsItems);
    } andFailure:^(NSError *error) {
        self.failureBlock(error);
    }];
}

// 加载Liked数据
- (void)loadSavedLikedData {
    [[PDKClient sharedInstance] getAuthenticatedUserLikesWithFields:[NSSet setWithArray:@[@"id", @"image", @"note"]] success:^(PDKResponseObject *responseObject) {
        self.savedLikedItems = [NSMutableArray arrayWithArray:responseObject.pins];
        
        self.successBlock(self.savedLikedItems);
    } andFailure:^(NSError *error) {
        self.failureBlock(error);
    }];
}

#pragma mark - 数据处理
- (void)handleJSONDict:(NSDictionary *)dict {
    self.savedUserItem = [SavedUserItem objectWithKeyValues:dict[@"data"]];
    
    self.savedUserItem.image_url = dict[@"data"][@"image"][@"60x60"][@"url"];
    self.savedUserItem.counts_following = dict[@"data"][@"counts"][@"following"];
    self.savedUserItem.counts_followers = dict[@"data"][@"counts"][@"followers"];

    self.successBlock(self.savedUserItem);
}

@end
