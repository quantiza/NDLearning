//
//  NHFindViewController.m
//  NH
//
//  Created by yangl on 2016/11/4.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHFindViewController.h"
#import "NHCustomSegmentView.h"
#import "NHHotViewController.h"
#import "NHSubscribeViewController.h"

@interface NHFindViewController ()

//通过segment按钮调出的子试图控制器
@property(nonatomic,strong) NHHotViewController* hotController;
@property(nonatomic,strong) NHSubscribeViewController* subController;
@property(nonatomic,strong) UIViewController* testVC;

@end

@implementation NHFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpItems];
    
}

- (void)setUpItems {
    _hotController = [[NHHotViewController alloc] init];
    _subController = [[NHSubscribeViewController alloc] init];
    NHCustomSegmentView *segment = [[NHCustomSegmentView alloc] initWithItemTitles:@[@"热吧", @"订阅"]];
    self.navigationItem.titleView = segment;
    segment.frame = CGRectMake(0, 0, 130, 35);
    WeakSelf(weakSelf);
    segment.NHCustomSegmentViewBtnClickHandle = ^(NHCustomSegmentView *segment, NSString *title, NSInteger currentIndex) {
        [weakSelf changeChildVcWithCurrentIndex:currentIndex];
    };
    [segment clickDefault];
}


#pragma mark 通过block控制segment调用子视图控制器
//？注意：原作者调用NHBaseViewController的方法添加删除视图，不知有何特殊意义
- (void)changeChildVcWithCurrentIndex:(NSInteger)currentIndex {
    BOOL isHot = (currentIndex == 0);
    
    if (isHot) { // 热门
        [self addChildVc:self.hotController];
        [self removeChildVc:self.subController];
    } else { // 订阅
        [self addChildVc:self.subController];
        [self removeChildVc:self.hotController];
    }
}



@end
