//
//  HSYEssenceController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/2.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYEssenceController.h"
#import "HSYAllViewController.h"
#import "HSYVideoViewController.h"
#import "HSYVoiceViewController.h"
#import "HSYPictureViewController.h"
#import "HSYWordViewController.h"
#import "HSYButton.h"
@interface HSYEssenceController()<UIScrollViewDelegate>
@property(nonatomic, weak)  UIView *tipView;
@property(nonatomic, weak)  UIView *titleView;
@property(nonatomic, weak)  UIButton *lstButn;
@property(nonatomic, weak)  UIScrollView *scroView;
@end
@implementation HSYEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
   
    
}
- (void)setupUI{
    //控制器是懒加载的
    //最后是在控制器内部设置颜色
    //在碗面设置背景眼self.view.backgroundColor会调用viewDidLoad方法
       self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = CommonBgColor;
    [self setNavItem];
    [self addChildviewControllerView];
    [self setScroview];
    [self setTitleView];
    [self addChildView];
    
}

- (void)setNavItem{
    
    // 标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];

    

}
-(void)setScroview{
    UIScrollView *scroView = [[UIScrollView alloc] init];
    
    scroView.delegate = self;
    scroView.backgroundColor = RandomColor;
    scroView.frame = [UIScreen mainScreen].bounds;
    scroView.contentSize = CGSizeMake(self.view.width * self.childViewControllers.count, 0);
    scroView.showsHorizontalScrollIndicator = NO;
    scroView.showsVerticalScrollIndicator = NO;
    scroView.pagingEnabled = YES;
    [self.view addSubview:scroView];
    //往scroview中添加子控件
        //scroview中添加自控制器的View
    _scroView = scroView;
    
 
}

- (void)addChildviewControllerView{
    
    //全部 @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    HSYAllViewController *allView = [[HSYAllViewController alloc] init];
    [self addChildViewController:allView];
    HSYVideoViewController *video = [[HSYVideoViewController alloc] init];
    [self addChildViewController:video];
    HSYVoiceViewController *voic = [[HSYVoiceViewController alloc] init];
    [self addChildViewController:voic];
    HSYPictureViewController *pic = [[HSYPictureViewController alloc] init];
    [self addChildViewController:pic];
    HSYWordViewController *word = [[HSYWordViewController alloc] init];
    [self addChildViewController:word];
    
    
}

- (void)setTitleView{
    UIView *titleView = [[UIView alloc] init];
    titleView.frame = CGRectMake(0, 64, self.view.width, 25);
    // 添加标题
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    titleView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.7];
    
    //添加按钮
    
    for (int i = 0; i <titles.count; i++) {
        HSYButton *butn = [HSYButton buttonWithType:UIButtonTypeCustom];
        CGFloat butnW = titleView.width / titles.count;
        CGFloat butnH = titleView.height;
        CGFloat butnX = i * butnW;
        CGFloat butnY = 0;
        butn.tag = i;
        butn.titleLabel.font = [UIFont systemFontOfSize:15];
        [butn setTitle:titles[i] forState:UIControlStateNormal];
        [butn setBackgroundColor:[UIColor clearColor]];
        [butn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        butn.frame = CGRectMake(butnX, butnY, butnW, butnH);
        
        [titleView addSubview:butn];
        [butn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    //添加指示器
    UIView *tipView = [[UIView alloc] init];
    tipView.height = 2;
    tipView.y = titleView.height;
    _tipView = tipView;
    _tipView.backgroundColor = [UIColor redColor];
    [titleView addSubview:tipView];
    _titleView = titleView;
    
    [self.view addSubview:titleView];
    HSYButton *butn =titleView.subviews.firstObject;
    //在这里跟新按钮了lable的尺寸
    [butn.titleLabel sizeToFit];
     _tipView.width = butn.titleLabel.width + 10;
    _tipView.centerX = butn.center.x;
    butn.selected = YES;
    _lstButn = butn;
    
}
#pragma mark - 按钮单击方法
- (void)didClick:(UIButton *)butn{
    
    
   
    _tipView.width = butn.titleLabel.width + 10;
    [UIView animateWithDuration:0.25 animations:^{
         _tipView.centerX = butn.center.x;
    }];
    _lstButn.selected = NO;
    
    butn.selected = YES;
    
    _lstButn = butn;
    //滚动视图
    CGPoint offset = _scroView.contentOffset;
    offset.x = _scroView.width * butn.tag;
 
    [_scroView setContentOffset:offset animated:YES];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

    
   
    [self addChildView];
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
     int index = _scroView.contentOffset.x / _scroView.width;
    UIButton *butn = _titleView.subviews[index];
    [self didClick:butn];
    [self addChildView];

}

- (void)addChildView{
     int index = _scroView.contentOffset.x / _scroView.width;
    UITableViewController  *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * _scroView.width, _scroView.y, _scroView.width, _scroView.height);
    vc.tableView.contentInset = UIEdgeInsetsMake(64 + 25, 0, 46, 0);
    [_scroView addSubview:vc.view];
    

}

- (void)tagClick
{
    LGLogFunc
}

@end
