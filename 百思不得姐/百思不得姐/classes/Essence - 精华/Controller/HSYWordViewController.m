//
//  HSYWordViewController.m
//  百思不得姐
//
//  Created by ming on 16/11/5.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYWordViewController.h"

@implementation HSYWordViewController
- (void)viewDidLoad{
    self.view.backgroundColor = RandomColor;
    [super viewDidLoad];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}

@end
