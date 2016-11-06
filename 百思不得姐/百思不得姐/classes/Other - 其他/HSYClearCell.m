//
//  HSYClearCell.m
//  百思不得姐
//
//  Created by ming on 16/11/5.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYClearCell.h"
#import <SDImageCache.h>
#import <SVProgressHUD.h>
@interface HSYClearCell()
@property(nonatomic, weak) UIActivityIndicatorView *activitiView;

@end


@implementation HSYClearCell

#define filePath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"status"]

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        [self filesize];
    }
    
    return self;
}
- (void)filesize{
    
    ///存在问题celld何时销魂问题
    ///当我点返回的时候就不应该往下走了
     UIActivityIndicatorView *activitiView = [[UIActivityIndicatorView alloc] init];
    self.activitiView = activitiView;
    self.textLabel.text = [NSString stringWithFormat:@"正在计算缓存"];
    self.userInteractionEnabled = NO;
    
    [activitiView setColor:[UIColor redColor]];
    self.accessoryView = activitiView;
    [activitiView startAnimating];
 
   __weak typeof(self) weakself = self;

   __block NSString *fileSize ;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
     
       
        //计算大小
        fileSize = [weakself getSizeStr:filePath];
        //在计算之后判断是够往下走
        // 如果cell已经销毁了, 就直接返回
 
        if (weakself == nil) {
            return ;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
    
            [activitiView stopAnimating];
            weakself.activitiView = nil;
            weakself.userInteractionEnabled = YES;
            NSString *sizeStr = fileSize ? fileSize:@"";
            weakself.textLabel.text = [NSString stringWithFormat:@"清除缓存%@",sizeStr];
            
            //[tableView reloadData];
            //添加手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:weakself action:@selector(clearDisk)];
            [weakself addGestureRecognizer:tap];
        });
        
    });
    
}

- (void)clearDisk{
    [self.activitiView startAnimating];
    self.textLabel.text = @"正在清除";
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    [SVProgressHUD showWithStatus:@"正在删除"];
   [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
       //删除文件
        NSFileManager *mnager = [NSFileManager defaultManager];
       dispatch_async(dispatch_get_main_queue(), ^{
           [NSThread sleepForTimeInterval:2];
           [mnager removeItemAtPath:filePath error:nil];
         
           [mnager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
           dispatch_async(dispatch_get_main_queue(), ^{
               [self.activitiView stopAnimating];
               self.textLabel.text = [NSString stringWithFormat:@"清除缓存%@",[self getSizeStr:filePath]];
               NSLog(@"删除文件成功");
               [SVProgressHUD dismiss];
               
               
           });
           
       });
       
   }];
 
}

-(NSString *)getSizeStr:(NSString *)path{
    
    NSString *fileSize ;
    unsigned long long size = path.fileSize;
    [NSThread sleepForTimeInterval:2];
 
    //加上sd_image的缓存
    size += [SDImageCache sharedImageCache].getSize;
    if (size > pow(10, 9)) {//GB
        fileSize = [NSString stringWithFormat:@"%.2fG",size/pow(10, 9)];
    }else if (size > pow(10, 6)){
        fileSize = [NSString stringWithFormat:@"%.2fM",size/pow(10, 6)];
        
    }else if (size > pow(10, 3)){
        
        fileSize = [NSString stringWithFormat:@"%.2fk",size/pow(10, 3)];
    }else{
        fileSize = [NSString stringWithFormat:@"%zdB",size];
    }

    return fileSize;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.activitiView startAnimating];
    
    
}
- (void)dealloc{
    
    NSLog(@"cell被销毁");
}

@end
