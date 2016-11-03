//
//  HSYTextField.m
//  百思不得姐
//
//  Created by ming on 16/11/3.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYTextField.h"
#import "UITextField+HSYTextField.h"

@implementation HSYTextField
- (void)awakeFromNib{
    
    [super awakeFromNib];
    // 设置光标颜色
    self.tintColor = [UIColor whiteColor];
    // 设置默认的占位文字颜色


    
}
- (BOOL)becomeFirstResponder{
    
    self.placeholderColor = [UIColor whiteColor];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{

    
    self.placeholderColor = nil;
    
    return [super resignFirstResponder];
}


@end
