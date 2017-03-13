//
//  SearchPinItemCell.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/13.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "SearchPinItemCell.h"
#import "SearchPinItem.h"

@interface SearchPinItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *pinImgView;
@property (weak, nonatomic) IBOutlet UILabel *pinLabel;

@end

@implementation SearchPinItemCell

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
- (void)setItem:(SearchPinItem *)item {
    _item = item;
    
    if (item) {
        [self.pinImgView lx_setImageWithURL:URLWithString(item.image_url) placeholderImage:ImageNamed(@"default_placeholder")];
        
        self.pinLabel.text = TrueString(item.note);
    }
}

@end
