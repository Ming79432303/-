//
//  UITextField+HSYTextField.m
//  百思不得姐
//
//  Created by ming on 16/11/3.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "UITextField+HSYTextField.h"

static NSString * const PlaceholderColorKey = @"placeholderLabel.textColor";
@implementation UITextField (HSYTextField)
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    NSString *placeholder = self.placeholder;
    self.placeholder = @" ";
    if (placeholderColor == nil) {
         placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    self.placeholder = placeholder;
    
    [self setValue:placeholderColor forKeyPath:PlaceholderColorKey];
    
    
}
- (UIColor *)placeholderColor{
     return self.placeholderColor;
}

@end
