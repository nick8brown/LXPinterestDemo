//
//  SavedBoardsItemCell.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "SavedBoardsItemCell.h"

@interface SavedBoardsItemCell ()

@property (weak, nonatomic) IBOutlet UILabel *boardLabel;
@property (weak, nonatomic) IBOutlet UIImageView *boardImgView;

@end

@implementation SavedBoardsItemCell

#pragma mark - private func
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [[[self class] alloc] initWithTableView:tableView];
}

- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self = [super init]) {
        self = DequeueReusable_Cell;
    }
    return self;
}

#pragma mark - setter&getter
- (void)setItem:(PDKBoard *)item {
    _item = item;
    
    if (item) {
        self.boardLabel.text = TrueString(item.name);
        
        [self.boardImgView lx_setImageWithURL:item.smallestImage.url placeholderImage:ImageNamed(@"default_placeholder")];
    }
}

@end
