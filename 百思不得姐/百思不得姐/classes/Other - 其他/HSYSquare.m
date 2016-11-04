//
//  HSYSquare.m
//  百思不得姐
//
//  Created by ming on 16/11/3.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYSquare.h"
#import <UIButton+WebCache.h>

@implementation HSYSquare

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
         self.titleLabel.textAlignment  = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.y = 0.1 * self.height;
    self.imageView.height = self.height * 0.5;
    self.imageView.width = self.imageView.height;
    self.imageView.centerX = self.width * 0.5;
    
    self.titleLabel.y = self.imageView.bottom;
     self.titleLabel.x = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
   
   

}
- (void)setSquare:(HSYMeSquare *)square{
    _square = square;
    
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
    [self setTitle:square.name forState:UIControlStateNormal];

    
}

@end
