//
//  HSYWebController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/4.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYWebController.h"

@interface HSYWebController ()<UIWebViewDelegate>

@end

@implementation HSYWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *webUrl = [NSURL URLWithString:self.url];
   
    NSURLRequest *request = [NSURLRequest requestWithURL:webUrl];

    UIView *webBrowserView = self.webView.scrollView.subviews[0];
    webBrowserView.y = 64;
    
    webBrowserView.backgroundColor = [UIColor whiteColor];
    
    [self.webView loadRequest:request];
    
    self.view.backgroundColor = CommonBgColor;
 
    self.webView.delegate = self;

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.back.enabled = webView.canGoBack;
    self.next.enabled = webView.canGoForward;
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.webView.backgroundColor = [UIColor redColor];
    
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

- (IBAction)back:(id)sender {
    [self.webView goBack];
}
- (IBAction)next:(id)sender {
    [self.webView goForward];
}
- (IBAction)load:(id)sender {
    [self.webView reload];
}


@end
