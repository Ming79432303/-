//
//  HSYFollowController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/2.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYFollowController.h"

@implementation HSYFollowController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = CommonBgColor;
    
    // 标题(不建议使用self.title属性)
    self.navigationItem.title = @"我的关注";
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(followClick)];
}

- (void)followClick
{
    LGLogFunc
    
    
}

@end
