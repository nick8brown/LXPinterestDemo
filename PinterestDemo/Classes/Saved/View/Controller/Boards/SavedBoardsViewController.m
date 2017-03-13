//
//  SavedBoardsViewController.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "SavedBoardsViewController.h"
#import "SavedViewModel.h"

#import "SavedBoardsItemCell.h"

#import "BoardsPinsViewController.h"

@interface SavedBoardsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) SavedViewModel *savedViewModel;

@end

@implementation SavedBoardsViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 绑定viewModel
    [self bindViewModel];
    
    // 初始化tableView
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [HZGProgressHUDTool showLoadingHUD];

    // 加载Boards数据
    [_savedViewModel loadSavedBoardsData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 绑定viewModel
- (void)bindViewModel {
    _savedViewModel = [[SavedViewModel alloc] initWithSuccessBlock:^(id data) {
        AppLog(@"-----【Saved】-----【Boards】-----【成功】-----");
        AppLog(@"%@", data);
        
        [HZGProgressHUDTool dismissLoadingHUD];

        [self.tableView reloadData];
    } errorBlock:^(NSInteger code) {
    } failureBlock:^(NSError *error) {
        AppLog(@"-----【Saved】-----【Boards】-----【失败】-----");
        AppLog(@"%@", error);
        
        [HZGProgressHUDTool dismissLoadingHUD];
    }];
}

#pragma mark - 初始化tableView
- (void)setupTableView {
    // 设置tableView
    self.tableView.rowHeight = SavedBoardsItemCell_HEIGHT;
    RegisterNib_for_Cell(SavedBoardsItemCell);
}

#pragma mark - UITableViewDataSource
// 段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedViewModel.savedBoardsItems.count;
}

// cell样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SavedBoardsItemCell *cell = [SavedBoardsItemCell cellWithTableView:tableView];
    cell.item = self.savedViewModel.savedBoardsItems[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
// 段头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

// 段尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

// 段头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

// 段尾视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

// 选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PDKBoard *item = self.savedViewModel.savedBoardsItems[indexPath.row];
    
    BoardsPinsViewController *boardsPinsVC = [BoardsPinsViewController nibController];
    boardsPinsVC.boardsPins_board = item;
    [self.navigationController pushViewController:boardsPinsVC animated:YES];
}

@end
