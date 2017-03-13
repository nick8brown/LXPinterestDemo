//
//  SavedLikedViewController.h
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^LoadDataBlock)();

@interface SavedLikedViewController : BaseViewController

@property (nonatomic, copy) LoadDataBlock loadDataBlock;

@end
