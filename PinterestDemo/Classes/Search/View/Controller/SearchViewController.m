//
//  SearchViewController.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/13.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchViewModel.h"

#import "SearchPinItemCell.h"

@interface SearchViewController () <UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) UISearchBar *searchBar;

@property (nonatomic, strong) SearchViewModel *searchViewModel;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 绑定viewModel
    [self bindViewModel];
    
    // 初始化tableView
    [self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 初始化导航栏
- (void)setupNavBar {
    // 子类重写

    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    [searchBar setBackgroundImage:[[UIImage alloc] init]];
    searchBar.placeholder = @"Search";
    searchBar.delegate = self;
    self.searchBar = searchBar;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBar];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(selectImage:)];
}

#pragma mark - 绑定viewModel
- (void)bindViewModel {
    _searchViewModel = [[SearchViewModel alloc] initWithSuccessBlock:^(id data) {
        AppLog(@"-----【Search】-----【Pins】-----【成功】-----");
        AppLog(@"%@", data);
        
        [HZGProgressHUDTool dismissLoadingHUD];
        
        [self.tableView reloadData];
    } errorBlock:^(NSInteger code) {
    } failureBlock:^(NSError *error) {
        AppLog(@"-----【Search】-----【Pins】-----【失败】-----");
        AppLog(@"%@", error);
        
        [HZGProgressHUDTool dismissLoadingHUD];
    }];
}

#pragma mark - 初始化tableView
- (void)setupTableView {
    // 设置tableView
    self.tableView.rowHeight = SearchPinItemCell_HEIGHT;
    RegisterNib_for_Cell(SearchPinItemCell);
}

#pragma mark - UITableViewDataSource
// 段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchViewModel.searchPinsItems.count) {
        return self.searchViewModel.searchPinsItems.count;
    }
    return 2;
}

// cell样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchPinItemCell *cell = [SearchPinItemCell cellWithTableView:tableView];
    if (self.searchViewModel.searchPinsItems.count) {
        cell.item = self.searchViewModel.searchPinsItems[indexPath.row];
    }
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
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar endEditing:YES];

    [HZGProgressHUDTool showLoadingHUD];
    
    // 0.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [PDKClient sharedInstance].oauthToken;
    params[@"fields"] = @"id,image,note";
    params[@"query"] = searchBar.text;
    
    // 1.加载用户数据
    [_searchViewModel loadSearchPinsDataWithParams:params];
}

#pragma mark - 监听按钮点击事件
- (void)selectImage:(UIBarButtonItem *)sender {
    [self actionSheetWithTitle:nil message:nil handlers:[self setupActionSheetHandlerForPhoto]];
}

@end
