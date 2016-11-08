//
//  HSYAllViewController.m
//  百思不得姐
//
//  Created by ming on 16/11/5.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYAllViewController.h"
#import "HSYHTTPSessionManager.h"
#import <UIImageView+WebCache.h>
#import <MJRefresh.h>
#import <MJExtension.h>
#import "HSYBdjList.h"
#import "HSYTopicCell.h"

@interface HSYAllViewController()
@property(nonatomic, strong) HSYHTTPSessionManager *manager;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, strong) NSMutableArray<HSYBdjList *> *listArray;
@property(nonatomic, copy) NSString *maxtime;
@end
@implementation HSYAllViewController
static NSString *cellID = @"ID";
- (HSYHTTPSessionManager *)manager{
    
    if (_manager == nil) {
        _manager = [HSYHTTPSessionManager manager];
    }
    
    return _manager;
}
- (void)viewDidLoad{
 
    
    [super viewDidLoad];
   
    [self setingTableView];
    
}
- (void)setingTableView{
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HSYTopicCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 250;
    self.view.backgroundColor = CommonBgColor;
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 25 + Margin, 0, 46, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   

    [self setRefreshView];
    
   
}
- (void)setRefreshView{
    self.view.backgroundColor = CommonBgColor;
    self.tableView.mj_header = [HSYRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loaNewData)];
    
    self.tableView.mj_footer = [HSYRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadOldData)];
    [self.tableView.mj_header beginRefreshing];
    
}
- (void)loaNewData{
        //取消上一次的请求任务
    
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
      
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    [self.manager GET:Url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        NSLog(@"%@",[NSThread currentThread]);
    
        
        NSLog(@"请求成功");
        
      self.listArray = [HSYBdjList mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
      
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        // 让[刷新控件]结束刷新
        [self.tableView.mj_header endRefreshing];
        // 让[刷新控件]结束刷新
     


    }];

    
    
}
//
- (void)loadOldData{
    //取消上一次的请求任务
     [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"maxtime"] = self.maxtime;
  
    [self.manager GET:Url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.maxtime = responseObject[@"info"][@"maxtime"];
        [self.listArray addObjectsFromArray:[HSYBdjList mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
        NSLog(@"请求成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
           [self.tableView.mj_footer endRefreshing];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HSYTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    HSYBdjList *list = self.listArray[indexPath.row];
    cell.list = list;
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    
       return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPat{
    
    
}

@end
