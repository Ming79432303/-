//
//  HSYBdjcomments.h
//  百思不得姐
//
//  Created by ming on 16/11/8.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HSYBdjUser;
@interface HSYBdjcomments : NSObject
@property(nonatomic, copy) NSString *content;
@property(nonatomic, strong) HSYBdjUser *user;
@end
