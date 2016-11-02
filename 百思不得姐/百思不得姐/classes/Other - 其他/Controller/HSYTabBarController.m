//
//  HSYTabBarController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/2.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYTabBarController.h"
#import "HSYNavigationController.h"
#import "HSYEssenceController.h"
#import "HSYFollowController.h"
#import "HSYMeController.h"
#import "HSYNewController.h"
#import "HSYTabBar.h"

@implementation HSYTabBarController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    /**** 设置所有UITabBarItem的文字属性 ****/
    [self setupItemTitleTextAttributes];
    
    /**** 添加子控制器 ****/
    [self setupChildViewControllers];
    
    /**** 更换TabBar ****/
    [self setupTabBar];
    
}
- (void)setupChildViewControllers{
    
    [self setupOneChildViewController:[[HSYNavigationController alloc] initWithRootViewController:[[HSYEssenceController alloc] init]] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupOneChildViewController:[[HSYNavigationController alloc] initWithRootViewController:[[HSYNewController alloc] init]] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupOneChildViewController:[[HSYNavigationController alloc] initWithRootViewController:[[HSYFollowController alloc] init]] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupOneChildViewController:[[HSYNavigationController alloc] initWithRootViewController:[[HSYMeController alloc] init]] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];

}
/**
 *  初始化一个子控制器
 *
 *  @param vc            子控制器
 *  @param title         标题
 *  @param image         图标
 *  @param selectedImage 选中的图标
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    if (image.length) { // 图片名有具体值
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
}


/**
 *  更换TabBar
 */
-(void)setupTabBar{
    //因为系统的tabBar只读所以可以同过kvc来设置
    [self setValue:[[HSYTabBar alloc] init] forKey:@"tabBar"];
}

- (void)setupItemTitleTextAttributes{
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateSelected];
    
}
@end
