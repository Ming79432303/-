//
//  HSYFootVIew.m
//  百思不得姐
//
//  Created by ming on 16/11/3.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYFootVIew.h"
#import <AFHTTPSessionManager.h>
#import <SDWebImageManager.h>
#import <UIButton+WebCache.h>
#import <MJExtension.h>
#import "HSYMeSquare.h"
#import "HSYSquare.h"
#import "HSYWebController.h"
#import <SafariServices/SafariServices.h>

@implementation HSYFootVIew

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self dowloadImage];
        
    }
    
    return self;
}
- (void)dowloadImage{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"square";
    params[@"c"] = @"topic";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
      // NSArray *butModelArray = [HSYMeSquare mj_keyValuesArrayWithObjectArray:responseObject[@"square_list"]];
         NSArray *squares = [HSYMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
        [self creatButtons:squares];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LGLog(@"请求失败");
    }];
    
}
-(void)creatButtons:(NSArray *)squareList{
    
    //设置按钮尺寸
    int count = 4;
    CGFloat butnW = self.width/count;
    CGFloat butnH = butnW;
    
    for (int i = 0; i<squareList.count; i ++) {
        
        HSYMeSquare *model = squareList[i];
        HSYSquare *butn = [[HSYSquare alloc] init];
        CGFloat lin = i/count;
        CGFloat loc = i%count;
        CGFloat butnX = loc * butnW;
        CGFloat butnY = lin * butnH;
        butn.frame = CGRectMake(butnX, butnY, butnW, butnH);
        [butn setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        
        //butn.backgroundColor = RandomColor;
        [self addSubview:butn];
 
        
        butn.square = model;
        [butn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }

    self.height = self.subviews.lastObject.bottom;
    UITableView *tableview = (UITableView *)self.superview;
    tableview.tableFooterView = self;
    [tableview reloadData];
    
    
}

- (void)didClick:(HSYSquare *)butn{
    NSLog(@"%@",butn.square.url);
    NSString *url = butn.square.url;
    if ([url hasPrefix:@"http"]) {
        //用web跳转
        HSYWebController *web = [[HSYWebController alloc] init];
          web.url = url;
        web.title = butn.square.name;
        UITabBarController *tabbar = (UITabBarController *)self.window.rootViewController;
        UINavigationController *selectController = tabbar.selectedViewController;
        [selectController pushViewController:web animated:YES];
//        SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url]];
//        [selectController presentViewController:safari animated:YES completion:nil];
      
        
    }else if ([url hasPrefix:@"mod"]){
        //跳转控制器
        
    }
    
    
    
    
}


@end
