//
//  SavedViewController.m
//  PinterestDemo
//
//  Created by CACAO on 2017/3/12.
//  Copyright © 2017年 zenglingxuan. All rights reserved.
//

#import "SavedViewController.h"
#import "SavedViewModel.h"

#import "SavedBoardsViewController.h"
#import "SavedPinsViewController.h"
#import "SavedLikedViewController.h"

@interface SavedViewController ()

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *followersLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingLabel;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *titleSegmentedControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) SavedViewModel *savedViewModel;

@end

@implementation SavedViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 绑定viewModel
    [self bindViewModel];
    
    // 初始化savedTitleView
    [self setupSavedTitleView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [HZGProgressHUDTool showLoadingHUD];
    
    // 0.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [PDKClient sharedInstance].oauthToken;
    params[@"fields"] = @"bio,first_name,last_name,image,counts";
    
    // 1.加载用户数据
    [_savedViewModel loadSavedUserDataWithParams:params];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 绑定viewModel
- (void)bindViewModel {
    _savedViewModel = [[SavedViewModel alloc] initWithSuccessBlock:^(id data) {
        AppLog(@"-----【Saved】-----【用户】-----【成功】-----");
        AppLog(@"%@", data);
        
        [HZGProgressHUDTool dismissLoadingHUD];

        // 初始化savedView
        [self setupSavedView:_savedViewModel.savedUserItem];
    } errorBlock:^(NSInteger code) {
    } failureBlock:^(NSError *error) {
        AppLog(@"-----【Saved】-----【用户】-----【失败】-----");
        AppLog(@"%@", error);
        
        [HZGProgressHUDTool dismissLoadingHUD];
    }];
}

#pragma mark - 初始化savedView
- (void)setupSavedView:(SavedUserItem *)item {
    self.usernameLabel.text = [NSString stringWithFormat:@"%@ %@", TrueString(item.first_name), TrueString(item.last_name)];
    
    self.iconImgView.layer.cornerRadius = CGRectGetWidth(self.iconImgView.frame) * 0.5;
    self.iconImgView.layer.masksToBounds = YES;
    [self.iconImgView lx_setImageWithURL:URLWithString(TrueString(item.image_url)) placeholderImage:ImageNamed(@"default_placeholder")];

    self.followersLabel.text = [NSString stringWithFormat:@"%@", item.counts_followers];
    
    self.followingLabel.text = [NSString stringWithFormat:@"%@", item.counts_following];
    
    self.bioLabel.text = TrueString(item.bio);
}

// 初始化savedTitleView
- (void)setupSavedTitleView {
    self.scrollView.contentSize = CGSizeMake(3*kScreen_WIDTH, 0);
    
    // 1.Boards
    SavedBoardsViewController *savedBoardsVC = [SavedBoardsViewController nibController];
    savedBoardsVC.view.frame = CGRectMake(0, 0, kScreen_WIDTH, CGRectGetHeight(self.scrollView.frame));
    
    // 2.Pins
    SavedPinsViewController *savedPinsVC = [SavedPinsViewController nibController];
    savedPinsVC.view.frame = CGRectMake(kScreen_WIDTH, 0, kScreen_WIDTH, CGRectGetHeight(self.scrollView.frame));

    // 3.Liked
    SavedLikedViewController *savedLikedVC = [SavedLikedViewController nibController];
    savedLikedVC.view.frame = CGRectMake(2*kScreen_WIDTH, 0, kScreen_WIDTH, CGRectGetHeight(self.scrollView.frame));

    [self addChildViewController:savedBoardsVC];
    [self addChildViewController:savedPinsVC];
    [self addChildViewController:savedLikedVC];
    [self.scrollView addSubview:savedBoardsVC.view];
    [self.scrollView addSubview:savedPinsVC.view];
    [self.scrollView addSubview:savedLikedVC.view];
}

#pragma mark - +
- (IBAction)createBoardOrPin:(UIBarButtonItem *)sender {
    [self actionSheetWithTitle:@"Add a Board or Pin" message:nil handlers:[self setupActionSheetHandlerForCreateBoardOrPin]];
}

- (NSArray *)setupActionSheetHandlerForCreateBoardOrPin {
    HZGAlertHandler *handler1 = [HZGAlertHandler handlerWithTitle:@"Create Board" alertAction:^(UIAlertAction *action) {

        // copy from Pinterest SDK
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Create Board"
                                                                       message:@"Enter the new board name:"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSString *boardName = [alert.textFields[0] text];
            [[PDKClient sharedInstance] createBoard:boardName
                                   boardDescription:nil
                                        withSuccess:^(PDKResponseObject *responseObject) {
                                            
                                            if ([responseObject isValid]) {
                                                PDKBoard *createdBoard = responseObject.board;
                                                [HZGProgressHUDTool lx_showSuccess:[NSString stringWithFormat:@"%@ created!", createdBoard.name]];
                                            }
                                            
                                        } andFailure:nil];
            
        }];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil];
        
        [alert addTextFieldWithConfigurationHandler:nil];
        [alert addAction:ok];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];

    }];
    
    HZGAlertHandler *handler2 = [HZGAlertHandler handlerWithTitle:@"Create Pin" alertAction:^(UIAlertAction *action) {
        
//        // copy from Pinterest SDK
//        [PDKPin pinWithImageURL:URLWithString(@"https://about.pinterest.com/sites/about/files/logo.jpg")
//                           link:URLWithString(@"https://www.pinterest.com")
//             suggestedBoardName:@"Tooty McFruity"
//                           note:@"The Pinterest Logo"
//                    withSuccess:^{
//            [HZGProgressHUDTool lx_showSuccess:@"successfully pinned pin"];
//        }
//                     andFailure:^(NSError *error) {
//            [HZGProgressHUDTool lx_showError:@"pin it failed"];
//        }];
        
    }];
    
    return @[handler1, handler2];
}

#pragma mark - edit
- (IBAction)editAndSetting:(UIBarButtonItem *)sender {
}

#pragma mark - Boards\Pins\Liked
- (IBAction)titleValueChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            self.scrollView.contentOffset = CGPointMake(0, 0);
        }
            break;
        case 1:
        {
            self.scrollView.contentOffset = CGPointMake(kScreen_WIDTH, 0);
            
            SavedPinsViewController *savedPinsVC = self.childViewControllers[1];
            if (savedPinsVC.loadDataBlock) {
                savedPinsVC.loadDataBlock();
            }
        }
            break;
        case 2:
        {
            self.scrollView.contentOffset = CGPointMake(2*kScreen_WIDTH, 0);
            
            SavedLikedViewController *savedLikedVC = self.childViewControllers[2];
            if (savedLikedVC.loadDataBlock) {
                savedLikedVC.loadDataBlock();
            }
        }
            break;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.titleSegmentedControl.selectedSegmentIndex = index;
}

@end
