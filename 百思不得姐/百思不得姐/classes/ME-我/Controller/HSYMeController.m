//
//  HSYMeController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/2.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYMeController.h"
#import "HSYSetingController.h"
#import "HSYTableViewCell.h"
#import "HSYFootVIew.h"
#import "HSYSquare.h"

@implementation HSYMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableview];
    
   }
- (void)setupTableview{
    self.view.backgroundColor = CommonBgColor;
    // 标题
    self.navigationItem.title = @"我的";
    // 右边-设置
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    // 右边-月亮
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    self.tableView.sectionFooterHeight = Margin;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(Margin - 36, 0, 0, 0);
    HSYFootVIew *footView= [[HSYFootVIew alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
   
    self.tableView.tableFooterView = footView;

    
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    HSYTableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[HSYTableViewCell alloc] init];
    }
    if (indexPath.section == 0) {
        
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
        cell.textLabel.text = @"登录/注册";
    }else if (indexPath.section == 1){
        
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    
    
    return cell;
}

@end
