//
//  HSYNewController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/2.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYNewController.h"

@implementation HSYNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
