//
//  UCAppStore.h
//  FengZi
//
//  Created by WangFeng on 11-12-15.
//  Copyright (c) 2012年 mymmsc.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UCAppStoreDelegate;

@interface UCAppStore : UIViewController {
    //
}

@property (nonatomic, assign) id<UCAppStoreDelegate> proxy;

- (IBAction)hideWindow:(id)sender;

// 转向数字商城
- (IBAction)gotoStoreTable:(id)sender;
// 转向电子商城
- (IBAction)gotoEBuy:(id)sender;

@end

@protocol UCAppStoreDelegate

- (void)closeAppStore;

@end