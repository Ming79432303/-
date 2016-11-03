//
//  HSYLogoinRegisterController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/3.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYLogoinRegisterController.h"
#import "HSYTextField.h"
#import "UITextField+HSYTextField.h"
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

    
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.loginLeading.constant =  -self.view.width;
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:0 animations:^{
            [self.view layoutIfNeeded];
        } completion:nil];

    }else{
        
        self.loginLeading.constant =  0;
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:0 animations:^{
            [self.view layoutIfNeeded];
        } completion:nil];

        
    }
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
