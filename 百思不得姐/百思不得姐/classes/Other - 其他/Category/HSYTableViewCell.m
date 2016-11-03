//
//  HSYTableViewCell.m
//  百思不得姐
//
//  Created by ming on 16/11/3.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYTableViewCell.h"

@implementation HSYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
        
    }
        
    return self;
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    if (self.imageView.image == nil) {
        return;
    }
    
    self.imageView.y = minMargin;
    
    self.imageView.height = self.contentView.height - 2*minMargin;
    self.imageView.width = self.imageView.height;
    self.textLabel.x = self.imageView.right + Margin;
    
    
}
@end
