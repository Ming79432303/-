//
//  HSYSquare.m
//  百思不得姐
//
//  Created by ming on 16/11/3.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYSquare.h"

@implementation HSYSquare
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.y = Margin;
    self.imageView.centerX = self.width * 0.5;
    self.imageView.height = self.height - 2 * Margin;
    self.imageView.width = self.imageView.height;
    
    self.titleLabel.y = self.imageView.y + self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
    self.titleLabel.textAlignment  = NSTextAlignmentCenter;
    self.titleLabel.x = 0;
    
    
    
}


@end
