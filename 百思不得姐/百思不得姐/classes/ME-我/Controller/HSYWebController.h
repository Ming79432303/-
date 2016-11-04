//
//  HSYWebController.h
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/4.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSYWebController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *next;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reload;


@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (copy , nonatomic) NSString *url;
@end
