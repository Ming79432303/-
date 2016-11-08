//
//  HSYTopicCell.m
//  百思不得姐
//
//  Created by ming on 16/11/7.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYTopicCell.h"
#import <UIImageView+WebCache.h>
@interface HSYTopicCell()


///** 用户的名字 */
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

//@property (nonatomic, copy) NSString *name;
///** 用户的头像 */
@property (weak, nonatomic) IBOutlet UIImageView *profileImageview;

///** 帖子审核通过的时间 */

@property (weak, nonatomic) IBOutlet UILabel *created_atLable;
///** 帖子的文字内容 */
@property (weak, nonatomic) IBOutlet UILabel *text_Lable;

///** 顶数量 */

@property (weak, nonatomic) IBOutlet UIButton *dinButton;
///** 踩数量 */
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
///** 评论数量 */
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
///** 分享 */
@property (weak, nonatomic) IBOutlet UIButton *repostButton;


@end
@implementation HSYTopicCell
- (void)setList:(HSYBdjList *)list{
    _list = list;
    
    [self.profileImageview sd_setImageWithURL:[NSURL URLWithString:list.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLable.text = list.name;
    self.created_atLable.text = list.created_at;
    self.text_Lable.text = list.text;
    [self setButton:self.dinButton count:list.ding placeholderName:@"顶"];
    [self setButton:self.caiButton count:list.cai placeholderName:@"踩"];
    [self setButton:self.commentButton count:list.comment placeholderName:@"评论"];
    [self setButton:self.repostButton count:list.repost placeholderName:@"分享"];

    
    
}
- (void)setButton:(UIButton *)button count:(NSInteger)count placeholderName:(NSString *)placeholderName{
    NSString *str;
    if (count > 10000) {
        str = [NSString stringWithFormat:@"%.2f万",count/1000.0];
    }else if (count > 0){
        
        str = [NSString stringWithFormat:@"%zd",count];
    }else{
        str = placeholderName;
    }
    
    [button setTitle:str forState:UIControlStateNormal];
    
}
- (IBAction)didClick:(id)sender {
    
    UIAlertController *aler = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择你要做的事情" preferredStyle:UIAlertControllerStyleActionSheet];
    [aler addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"举报");
    }]];
    [aler addAction:[UIAlertAction actionWithTitle:@"其他" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"其他");
    }]];
    [aler addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"删除");
    }]];
    
    [self.window.rootViewController presentViewController:aler animated:YES completion:nil];
    
    
}
//拦截系统设置的frame
- (void)setFrame:(CGRect)frame{
    frame.size.height -= 10;
    
    [super setFrame:frame];
    
}
@end
