//
//  HZGAPP_Define.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/22.
//  Copyright © 2016年 KFM. All rights reserved.
//  好找工项目-自定义宏

#ifndef HZGAPP_Define_h
#define HZGAPP_Define_h


/*------------------------------调试------------------------------*/

#ifdef DEBUG

#define AppLog(...) printf("%s %s %s\n", [[NSString getCurrentTimeWithDateFormat:YEAR_MONTH_DAY_HOUR_MINUTE_SECOND] UTF8String], [[NSString stringWithFormat:@"HZGAPP[%@]", [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent] UTF8String], [[NSString stringWithFormat:__VA_ARGS__] UTF8String])

#else

#define AppLog(...)

#endif


/*------------------------------视图大小位置------------------------------*/

// 系统性参数
#define SYS_StatusBar_HEIGHT 20
#define SYS_NavigationBar_HEIGHT 64
#define SYS_Toolbar_HEIGHT 44
#define SYS_TabBar_HEIGHT 49
#define SYS_Spacing_HEIGHT 8

// 屏幕尺寸
#define kScreen_WIDTH [UIScreen mainScreen].bounds.size.width
#define kScreen_HEIGHT [UIScreen mainScreen].bounds.size.height

// iPhone机型
#define IS_iPhone5s_Before ((kScreen_WIDTH == 320) ? YES : NO)
#define IS_iPhone6s_Later ((kScreen_WIDTH == 375) ? YES : NO)
#define IS_iPhone6sPlus_Later ((kScreen_WIDTH == 414) ? YES : NO)

// 最小间隔
#define minimumSpacing 10


/*------------------------------字体、颜色------------------------------*/

// 系统颜色
#define SYS_Black_Color [UIColor blackColor]
#define SYS_DarkGray_Color [UIColor darkGrayColor]
#define SYS_LightGray_Color [UIColor lightGrayColor]
#define SYS_White_Color [UIColor whiteColor]
#define SYS_Gray_Color [UIColor grayColor]
#define SYS_Red_Color [UIColor redColor]
#define SYS_Green_Color [UIColor greenColor]
#define SYS_Blue_Color [UIColor blueColor]
#define SYS_Cyan_Color [UIColor cyanColor]
#define SYS_Yellow_Color [UIColor yellowColor]
#define SYS_Magenta_Color [UIColor magentaColor]
#define SYS_Orange_Color [UIColor orangeColor]
#define SYS_Purple_Color [UIColor purpleColor]
#define SYS_Brown_Color [UIColor brownColor]
#define SYS_Clear_Color [UIColor clearColor]
#define SYS_Random_Color [UIColor randomColor]

// 字体
#define AppFont(x) [UIFont systemFontOfSize:x]
#define AppBoldFont(x) [UIFont boldSystemFontOfSize:x]

// 颜色
#define AppColor(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define AppAlphaColor(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define AppMainThemeColor AppColor(20, 131, 203) // app主题颜色

#define AppBGColor AppColor(242, 242, 242) // app背景颜色
#define AppSeparateLineColor AppColor(222, 222, 222) // app分隔线颜色


/*------------------------------图片------------------------------*/

#import "HZGImageTool.h"

#define ImageNamed(name) [UIImage imageNamed:name]
#define URLWithString(url) [NSURL URLWithString:url]


/*------------------------------其它------------------------------*/

#import <PinterestSDK.h>
#import <PDKBoard.h>
#import <PDKPin.h>
#import <PDKUser.h>
#import <PDKImageInfo.h>

#import "MJExtension.h"

#import "NSString+LX.h"
#import "NSData+LX.h"
#import "UIView+LX.h"
#import "UIColor+LX.h"
#import "UIImage+LX.h"
#import "UITextView+LX.h"

#import "HZGHttpTool.h"
#import "HZGProgressHUDTool.h"

// key
#define App_Run_count_KEY @"runCount"

// tag基数
#define BASE_TAG 100

// 每页条数
#define PAGE_COUNT 15

// 真NSString类
#define TrueString(str) [NSString isIfNullWithString:str]

// 真NSDictionary类
#define TrueDictionary(dict) ((!dict || ![dict isKindOfClass:[NSDictionary class]]) ? NO : YES)

// 真NSArray类
#define TrueArray(array) ((!array || ![array isKindOfClass:[NSArray class]]) ? NO : YES)

// tableView注册
#define RegisterClass_for_Cell(tableViewCell) [self.tableView registerClass:[tableViewCell class] forCellReuseIdentifier:NSStringFromClass([tableViewCell class])]
#define RegisterClass_for_HeaderFooterView(tableViewHeaderFooterView) [self.tableView registerClass:[tableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([tableViewHeaderFooterView class])]
#define RegisterNib_for_Cell(tableViewCell) [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([tableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([tableViewCell class])]
#define RegisterNib_for_HeaderFooterView(tableViewHeaderFooterView) [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([tableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([tableViewCell class])]

// tableView出列
#define DequeueReusable_Cell [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])]
#define DequeueReusable_HeaderFooterView [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([self class])]


/*------------------------------第三方------------------------------*/

// Pinterest
#define Pinterest_APPID @"4888949793377765348"
#define Pinterest_APPSECRET @"b73cbdee20879da2d7c64d6ede1bc74e64682c7651033eae970b846097701414"
//#define Pinterest_NotifyURL [NSString stringWithFormat:@"http://api.hzg9999.com/%@/data/payment/alipay/notify_url.php", [HZGInpourParam param].version]
//#define Pinterest_AppScheme @"com.hzg99.HZGRCK"


#endif /* HZGAPP_Define_h */
