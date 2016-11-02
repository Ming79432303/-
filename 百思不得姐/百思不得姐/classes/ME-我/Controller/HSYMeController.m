//
//  HSYMeController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/2.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYMeController.h"
#import "HSYSetingController.h"

@implementation HSYMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = CommonBgColor;
    // 标题
    self.navigationItem.title = @"我的";
    // 右边-设置
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    // 右边-月亮
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

- (void)settingClick
{
    LGLogFunc;
    [self.navigationController pushViewController:[[HSYSetingController alloc] init] animated:YES];
    
}

- (void)moonClick
{
   LGLogFunc
}

@end
