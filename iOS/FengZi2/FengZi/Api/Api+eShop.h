//
//  Api+eShop.h
//  FengZi
//
//  Created by WangFeng on 11-12-15.
//  Copyright (c) 2012年 mymmsc.org. All rights reserved.
//

#import "Api.h"
#import <iOSApi/iOSApi+Crypto.h>
#import <iOSApi/iOSFile.h>
//====================================< 数字商城 - 接口 >====================================
//{[{"id":"1001","name":"西藏生死书","info":"这本书很好看","type":"1","writer":"朵朵花开","price":"0.0"},{"id":"1001","name":"双截棍","info":"专辑音乐","type":"1", "writer":"孙超","price":"0.0"}]}

//====================================< 数字商城 - 接口 >====================================
@interface ProductInfo : NSObject {
    NSString *name, *info, *writer, *orderProductUrl, *realUrl;
    int pid, type;
    float price;
    NSString *picurl;
    NSString *productLogo;
    
    int state;
}

@property (nonatomic, retain) NSString *name, *info, *writer, *orderProductUrl, *realUrl, *picurl, *productLogo;
@property (nonatomic, assign) int pid, type;
@property (nonatomic, assign) float price;
@property (nonatomic, assign) int state;

- (NSString *)url;
@end

@interface ProductInfo2 : NSObject {
    //{"id":"1001","typename":"电子书","shopname":"青春骚动","publisher":"男生女生","writer":"白继红","pricetype":"免费","info":"这本书讲述了白继红的缘由",”picurl”:”http://xx.xx.xxx.xxx/eshop/a.jpg”}
    int id;// 商品ID
    NSString *typename; // 类型名称
    NSString *shopname; // 商品名称
    NSString *publisher; // 发布者
    NSString *writer; // 作者
    NSString *pricetype; // 计费类型
    NSString *info;
    NSString *picurl;
    BOOL      isOrder;
    NSString *productUrl;
}

@property (nonatomic, assign) int id;
@property (nonatomic, retain) NSString *typename, *shopname, *info, *writer, *publisher, *pricetype, *picurl, *productUrl;
@property (nonatomic, assign) BOOL isOrder;

@end

//====================================< 数字商城 - 接口 >====================================
@interface PersonInfo : NSObject {
    int pid;
    NSString *picUrl;
}

@property (nonatomic, retain) NSString *picUrl;
@property (nonatomic, assign) int pid;

@end

//====================================< 数字商城 - 接口 >====================================

@interface ContentInfo : NSObject {
    int pid;
    NSString *username;
    NSString *content;
}

@property (nonatomic, assign) int pid;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *content;

@end

//====================================< 数字商城 - 接口 >====================================
@interface Api (AppStore)

+ (NSString *)typeIcon:(int)index;
+ (NSString *)typeName:(int)index;
+ (NSString *)sortName:(int)index;
+ (NSString *)priceName:(int)index;


// 商城列表
+ (NSMutableArray *)storeList:(int)type
                     sorttype:(int)sorttype
                    pricetype:(int)pricetype
                       person:(int)person
                         page:(int)page;

// 订购
+ (ApiResult *)subscribe:(int)pid;

// 我的订购
+ (NSMutableArray *)orderList:(int)page;

+ (NSMutableArray *)personList;

// 相关产品
+ (NSMutableArray *)relation:(int)pid
                        page:(int)page;

// 评论
+ (NSMutableArray *)bbsList:(int)pid
                       page:(int)page;
// 提交评论
+ (ApiResult *)conmment:(int)pid
              username:(NSString *)username
                   msg:(NSString *)msg;

+ (ProductInfo2 *)proinfo:(int)pid;

@end