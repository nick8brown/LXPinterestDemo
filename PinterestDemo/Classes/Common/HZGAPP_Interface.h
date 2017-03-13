//
//  HZGAPP_Interface.h
//  HZGAPP
//
//  Created by 曾令轩 on 16/4/22.
//  Copyright © 2016年 KFM. All rights reserved.
//  好找工项目-数据接口

#ifndef HZGAPP_Interface_h
#define HZGAPP_Interface_h


// 后台服务器访问地址
//#ifdef DEBUG
//#define HTTP_API_URL @""
//#else
#define HTTP_API_URL @"https://api.pinterest.com/v1"
//#endif

// AFN错误码（似乎已断开与互联网的连接）
#define HTTP_ERROR_CODE -1009


/*------------------------------Home------------------------------*/
/*------------------------------Search------------------------------*/
/*------------------------------Saved------------------------------*/

#define APP_SAVED_USER_URL [NSString stringWithFormat:@"%@/me/", HTTP_API_URL]
#define APP_HOME_BOARDS_URL [NSString stringWithFormat:@"%@/me/boards/suggested/", HTTP_API_URL]
#define APP_SEARCH_PINS_URL [NSString stringWithFormat:@"%@/me/search/pins/", HTTP_API_URL]


#endif /* HZGAPP_Interface_h */
