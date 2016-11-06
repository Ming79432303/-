//
//  HSYSetingController.m
//  百思不得姐
//
//  Created by Apple_Lzzy27 on 16/11/2.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "HSYSetingController.h"
#import "HSYClearCell.h"
#import "HSYOtherCell.h"
#import <SDImageCache.h>
@interface HSYSetingController ()

@end

@implementation HSYSetingController
static NSString *cellId = @"cellId";
static NSString *otherCellId = @"OtherCellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    [self.tableView registerClass:[HSYClearCell class] forCellReuseIdentifier:cellId];
    [self.tableView registerClass:[HSYOtherCell class] forCellReuseIdentifier:otherCellId];

    //
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        HSYClearCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        return cell;
    }else{
        HSYOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:otherCellId];
        cell.textLabel.text = @"你好";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    
    
    

 
    
}
- (void)dealloc{
    NSLog(@"控制器被销魂");
    
}
@end
