//
//  BoardsPinsViewController.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "BoardsPinsViewController.h"
#import "SavedViewModel.h"

#import "LXFlowLayout.h"
#import "BoardsPinsItemCell.h"

@interface BoardsPinsViewController () <LXFlowLayoutDelegate, UICollectionViewDataSource>

{
    CGFloat _imageH;
    CGFloat _descTextH;
}
@property (weak, nonatomic) IBOutlet LXFlowLayout *layout;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) SavedViewModel *savedViewModel;

@end

@implementation BoardsPinsViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 绑定viewModel
    [self bindViewModel];
    
    // 初始化collectionView
    [self setupCollectionView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [HZGProgressHUDTool showLoadingHUD];
    
    // 加载Boards数据
    [_savedViewModel loadBoardsPinsDataWithBoard:self.boardsPins_board];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 绑定viewModel
- (void)bindViewModel {
    _savedViewModel = [[SavedViewModel alloc] initWithSuccessBlock:^(id data) {
        AppLog(@"-----【Saved】-----【BoardsPins】-----【成功】-----");
        AppLog(@"%@", data);
        
        [HZGProgressHUDTool dismissLoadingHUD];

        [self.collectionView reloadData];
    } errorBlock:^(NSInteger code) {
    } failureBlock:^(NSError *error) {
        AppLog(@"-----【Saved】-----【BoardsPins】-----【失败】-----");
        AppLog(@"%@", error);
        
        [HZGProgressHUDTool dismissLoadingHUD];
    }];
}

#pragma mark - 初始化collectionView
- (void)setupCollectionView {
    // 设置collectionView
    self.layout.colCount = 2;
    self.layout.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BoardsPinsItemCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([BoardsPinsItemCell class])];
}

#pragma mark - LXFlowLayoutDelegate
- (CGFloat)flowLayout:(LXFlowLayout *)layout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath {
    PDKPin *item = self.savedViewModel.boardsPinsItems[indexPath.item];

    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:item.largestImage.url]];
    CGFloat ratio = image.size.width / image.size.height;
    _imageH = 100 / ratio;
    
    NSString *descText = item.descriptionText;
    _descTextH = [descText heightWithFont:AppFont(15) withinSize:CGSizeMake(width, MAXFLOAT)];
    
    return _imageH + _descTextH;
}

#pragma mark UICollectionViewDataSource
// 项数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.savedViewModel.boardsPinsItems.count;
}
// cell样式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BoardsPinsItemCell *cell = [BoardsPinsItemCell cellWithCollectionView:collectionView indexPath:indexPath];
    cell.imageH = _imageH;
    cell.descTextH = _descTextH;
    cell.item = self.savedViewModel.boardsPinsItems[indexPath.item];
    return cell;
}

@end
