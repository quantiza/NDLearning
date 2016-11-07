//
//  NHSubscribeViewController.m
//  NH
//
//  Created by yangl on 2016/11/5.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHSubscribeViewController.h"

@interface NHSubscribeViewController ()

@end

@implementation NHSubscribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = BLUE_COLOR;
    [self setUpViews];
}

- (void)setUpViews {
    self.sepLineColor = RED_CLOOR;
    [self setNeedCellSepLine:YES];
    self.refreshType = NHBaseTableVcRefreshTypeRefreshAndLoadMore;
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    testView.backgroundColor = BLUE_COLOR;
    [self.view addSubview:testView];
}


#pragma mark - UITableViewDelegate

- (NSInteger)nh_numberOfSections {
    return 1;
}

- (NSInteger)nh_numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NHBaseTableViewCell *)nh_cellAtIndexPath:(NSIndexPath *)indexPath {
    NHBaseTableViewCell *cell = [[NHBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    return cell;
}










@end
