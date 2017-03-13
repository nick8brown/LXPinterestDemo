//
//  BoardsPinsItemCell.h
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDKPin;

@interface BoardsPinsItemCell : UICollectionViewCell

@property (nonatomic, assign) CGFloat imageH;
@property (nonatomic, assign) CGFloat descTextH;

// pin
@property (nonatomic, strong) PDKPin *item;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
