//
//  BoardsPinsItemCell.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "BoardsPinsItemCell.h"

@interface BoardsPinsItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *pinImgView;
@property (weak, nonatomic) IBOutlet UILabel *pinLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pinImgView_Height_Constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pinLabel_Height_Constraint;

@end

@implementation BoardsPinsItemCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    return [[[self class] alloc] initWithCollectionView:collectionView indexPath:indexPath];
}

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    if (self = [super init]) {
        self = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    }
    return self;
}

- (void)setItem:(PDKPin *)item {
    _item = item;
    
    if (item) {
        self.pinImgView.clipsToBounds = YES;
        [self.pinImgView lx_setImageWithURL:item.largestImage.url placeholderImage:ImageNamed(@"default_placeholder")];
        
        self.pinLabel.text = TrueString(item.descriptionText);
        
        self.pinImgView_Height_Constraint.constant = self.imageH;
        
        self.pinLabel_Height_Constraint.constant = self.descTextH;
    }
}

@end
