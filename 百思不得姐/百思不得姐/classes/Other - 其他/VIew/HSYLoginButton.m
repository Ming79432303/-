//
//  HSYLoginButton.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/3.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYLoginButton.h"

@implementation HSYLoginButton

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.centerX = self.width * 0.5;
    
    self.titleLabel.y = self.imageView.y + self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
    self.titleLabel.textAlignment  = NSTextAlignmentCenter;
    self.titleLabel.x = 0;


    
}

@end
