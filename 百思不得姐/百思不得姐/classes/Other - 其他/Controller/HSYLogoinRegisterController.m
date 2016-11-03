//
//  HSYLogoinRegisterController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/3.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYLogoinRegisterController.h"

@interface HSYLogoinRegisterController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginLeading;

@end

@implementation HSYLogoinRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)logoinRegister:(UIButton *)sender {
    self.loginLeading.constant =  -self.view.width;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
