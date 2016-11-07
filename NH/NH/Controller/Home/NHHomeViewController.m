//
//  NHHomeViewController.m
//  NH
//
//  Created by yangl on 2016/11/4.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHHomeViewController.h"
#import "NHCustomSegmentView.h"

@interface NHHomeViewController ()

@end

@implementation NHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpItems];
    // Do any additional setup after loading the view.
}

#pragma mark 设置导航栏
- (void)setUpItems {
    self.title = @"首页";
    // 精选关注
    NHCustomSegmentView *segment = [[NHCustomSegmentView alloc] initWithItemTitles:@[@"精选", @"关注"]];
    segment.frame = CGRectMake(0, 0, 130, 35);
    self.navigationItem.titleView = segment;
    [segment clickDefault];
}

@end
