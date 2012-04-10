//
//  EBuyPanel.m
//  FengZi
//
//  Created by wangfeng on 12-4-10.
//  Copyright (c) 2012年 ifengzi.cn. All rights reserved.
//

#import "EBuyPanel.h"

@implementation EBuyPanel
@synthesize ownerId;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //_scrollView.delegate = self;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

// 站内消息
- (IBAction)doSiteMsg:(id)sender{
    //
}

// 我的订单
- (IBAction)doMyOrder:(id)sender{
    //
}

// 购物车
- (IBAction)doShoppingCar:(id)sender{
    //
}

// 我的收藏
- (IBAction)doCollect:(id)sender{
    //
}

// 评价
- (IBAction)doComment:(id)sender{
    //
}

// 分类
- (IBAction)doGroup:(id)sender{
    //
}

@end