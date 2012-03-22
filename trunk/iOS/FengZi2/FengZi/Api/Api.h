//
//  Api.h
//  FengZi
//
//  Created by WangFeng on 11-12-15.
//  Copyright (c) 2012年 mymmsc.org. All rights reserved.
//

#import <iOSApi/iOSApi.h>
#import <iOSApi/iOSApi+Window.h>
#import <iOSApi/iOSApi+Crypto.h>
#import <iOSApi/iOSAction.h>
#import <iOSApi/iOSFile.h>
#import <iOSApi/iOSInput.h>
#import <iOSApi/JSONKit.h>
#import <iOSApi/HttpClient.h>
#import <iOSApi/UIImage+Scale.h>
#import <iOSApi/NSArray+Utils.h>
#import <iOSApi/NSObject+Utils.h>
#import <iOSApi/NSString+Utils.h>
#import <iOSApi/NSDictionary+Utils.h>
#import <iOSApi/iOSToast.h>

#define kCellIconHeight 24.0f

#define API_INTERFACE_TEST (1)

#define API_TEXT_SPACE @"　"

// 文件缓冲路径
#define API_CACHE_FILEPATH   @"cache/files"

#define API_TEST_AUTHCODE    @"1234"
#define API_INTERFACE_TONKEN @"uLN9UhI9Uhd-UhGGuh78uQ"

// 富媒体接口地址
#define API_URL_RICHMEDIA    @"http://m.fengxiafei.com/mb"
// 空码接口地址
#define API_URL_KMA          @"http://m.fengxiafei.com/mb"
// 用户中心借口地质
#define API_URL_USERCENTER   @"http://ifengzi.cn"
// 数字商城
#define API_URL_ESHOP        @"http://220.231.48.34:38080"
//#define API_URL_ESHOP        @"http://220.231.48.34:9000/eshop"

// 电子商城
#define API_URL_EBUY         @"http://220.231.48.34:38080/ebuy/fx"

//====================================< 用户信息 >====================================

#define API_CACHE_USERID @"app_userId"
#define API_CACHE_NKNAME @"app_nikename"
#define API_CACHE_PASSWD @"app_passwd"
#define API_CACHE_ISSAVE @"app_isSave"

@interface UserInfo : NSObject {
    int       userId;      // 用户Id
    NSString *userName;    // 姓名
    NSString *phoneNumber; // 用户手机号码
    NSString *nikeName;    // 用户昵称
    NSString *password;    // 用户密码
    NSString *sessionPassword; // 密码明文进行base64加密的结果
}

@property (nonatomic, assign) int userId;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *phoneNumber;
@property (nonatomic, retain) NSString *nikeName;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *sessionPassword;

@end

//====================================< 接口响应类 >====================================
@interface ApiResult : NSObject {
    int       status;
    NSString *message;
}

@property (nonatomic, assign) int status;
@property (nonatomic, copy) NSString *message;

- (NSDictionary *)parse:(NSDictionary *)map;

@end

//====================================< 接口功能 >====================================
@interface Api : NSObject {
    //
}

//--------------------< 接口 - 对象 - BASE64 >--------------------
+ (NSString *)base64e:(NSString *)s;

//--------------------< 接口 - 对象 - 用户信息 >--------------------
+ (UserInfo *)user;

+ (void)setUser:(UserInfo *)info;

// 设定用户ID
+ (void)setUserId:(int)userId;

// 获取用户ID
+ (int)userId;

// 设定用户手机号码
+ (void)setUserPhone:(NSString *)userPhone;

// 获取用户手机号码
+ (NSString *)userPhone;

// 获取用户密码
+ (NSString *)passwd;

// 设定用户密码
+ (void)setPasswd:(NSString *)passwd;

+ (NSString *)sessionPassword;
+ (void)setSessionPassword:(NSString *)passwd;
// 获取昵称
+ (NSString *)nikeName;

// 设定昵称
+ (void)setNikeName:(NSString *)nikeName;

// 判断用户是否在线
+ (BOOL)isOnLine;

//--------------------< 富媒体 - 对象 - 模板类 >--------------------

// 是否空码, 默认为空码
+ (BOOL)kma;

// 设定是否为空码模式
+ (void)setKma:(BOOL)isKma;

//--------------------< 业务处理 - 接口 >--------------------
+ (NSDictionary *)parseUrl:(NSString *)url;
+ (int)getInt:(id)value;
+ (float)getFloat:(id)value;
+ (NSString *)getString:(id)value;

+ (NSMutableDictionary *)post:(NSString *)action params:(NSDictionary *)param;

@end