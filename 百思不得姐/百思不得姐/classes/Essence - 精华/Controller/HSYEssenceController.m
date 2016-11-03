//
//  HSYEssenceController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/2.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYEssenceController.h"

@implementation HSYEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    //控制器是懒加载的
    //最后是在控制器内部设置颜色
    //在碗面设置背景眼self.view.backgroundColor会调用viewDidLoad方法
    self.view.backgroundColor = CommonBgColor;
    
    // 标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    
}


- (void)tagClick
{
    LGLogFunc
}

@end
