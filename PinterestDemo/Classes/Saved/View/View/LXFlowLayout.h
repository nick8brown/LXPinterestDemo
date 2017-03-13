//
//  LXFlowLayout.h
//  瀑布流2
//
//  Created by air on 15/12/16.
//  Copyright © 2015年 aoyolo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXFlowLayout;

@protocol LXFlowLayoutDelegate <NSObject>
@optional
- (CGFloat)flowLayout:(LXFlowLayout *)layout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;
@end

@interface LXFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) NSInteger colCount;
@property (nonatomic, strong) NSArray *models;
@property (nonatomic, weak) id <LXFlowLayoutDelegate> delegate;
@end
