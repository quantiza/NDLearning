//
//  NHHomeViewController.m
//  NH
//
//  Created by yangl on 2016/11/4.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHHomeViewController.h"
#import "NHCustomSegmentView.h"
#import "NHHeaderOptionView.h"
#import "NHCustomSlideViewController.h"
#import "NHBaseRequest.h"
#import "NHCustomWebViewController.h"
#import "NHContentViewController.h"

@interface NHHomeViewController () <NHCustomSlideViewControllerDelegate, NHCustomSlideViewControllerDataSource>

@property(nonatomic,strong) NHHeaderOptionView *optionView;
@property(nonatomic,strong) NHCustomSlideViewController *slideVC;
@property(nonatomic,strong) NSMutableArray *titles;
@property(nonatomic,strong) NSMutableArray *urls;

@property(nonatomic,strong) NSMutableArray *controllers;
@end

@implementation NHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpItems];
    [self getData];
}

#pragma mark 设置导航栏
- (void)setUpItems {
    //菜单栏
    _optionView = [[NHHeaderOptionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    [self.view addSubview:_optionView];
    //slider控件
    _slideVC = [[NHCustomSlideViewController alloc] init];
    _slideVC.view.frame = CGRectMake(0, _optionView.height, kScreenWidth, kScreenHeight - _optionView.height - kTopBarHeight);
    _slideVC.view.backgroundColor = kClearColor;
    [_slideVC willMoveToParentViewController:self];
    [self addChildViewController:_slideVC];
    [self.view addSubview:_slideVC.view];
    _slideVC.delgate = self;
    _slideVC.dataSource = self;
    // 精选关注
    NHCustomSegmentView *segment = [[NHCustomSegmentView alloc] initWithItemTitles:@[@"精选", @"关注"]];
    segment.frame = CGRectMake(0, 0, 130, 35);
    self.navigationItem.titleView = segment;
    [segment clickDefault];
    segment.NHCustomSegmentViewBtnClickHandle = ^(NHCustomSegmentView *segment, NSString *title, NSInteger currentIndex) {
        NSLog(@"===============%ld",(long)currentIndex);
        BOOL isFeatured = (currentIndex == 0);
        _optionView.hidden = !isFeatured;
        _slideVC.view.hidden = !isFeatured;
        NSLog(@"self.sliderViewConctoller hidden = true");
        NSLog(@"self.attentionController hidden = false");
        
    };
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(rightItemClick)];
}


- (void)rightItemClick {
    NSLog(@"Dont touch me");
}

#pragma mark 设置视图
- (void)getData {
    NHBaseRequest *request = [[NHBaseRequest alloc] init];
    request.nh_url = kNHHomeServiceListAPI;
    [request nh_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            NSLog(@">>>>>>>>>>>>>>>>>>>>>>success!");
            _models = [NHServiceListModel modelArrayWithDictArray:response];
            [self createUI];
        }
    }];
}

#pragma mark 通过获取数据设置菜单标题，以及对应内容
- (void)createUI {
    _titles = [NSMutableArray new];
    _urls = [NSMutableArray new];
    _controllers = [NSMutableArray new];
    
    for (NHServiceListModel *model in _models) {
        [_titles addObject:model.name];
        [_urls addObject:model.url];
    }
    
    for (int i = 0; i < _urls.count; i++) {
        if ([_titles[i] isEqualToString:@"游戏"]) {
            NHCustomWebViewController *controller = [[NHCustomWebViewController alloc] initWithUrl:_urls[i]];
            [_controllers addObject:controller];
        } else {
            NSLog(@"Add home content here");
            NHContentViewController *contentCtrl = [[NHContentViewController alloc] initWithUrl:_urls[i]];
            [_controllers addObject:contentCtrl];
        }
    }
    _optionView.titles = _titles.copy;
    WeakSelf(weakSelf);
    _optionView.homeHeaderOptionalViewItemClickHandle = ^(NHHeaderOptionView *view, NSString *currentTitle, NSInteger currentIndex) {
        weakSelf.slideVC.seletedIndex = currentIndex;
    };
    [_slideVC reloadData];
}


#pragma mark 代理方法
- (NSInteger)numberOfChildViewControllersInSlideViewController:(NHCustomSlideViewController *)slideViewController {
    return _titles.count;
}

- (UIViewController *)slideViewController:(NHCustomSlideViewController *)slideViewController viewControllerAtIndex:(NSInteger)index {
    return _controllers[index];
}

- (void)customSlideViewController:(NHCustomSlideViewController *)slideViewController slideOffset:(CGPoint)slideOffset {
    //可以产生一个连续的偏移量，从而带动optionView移动
    _optionView.contentOffset = slideOffset;
//    NSLog(@"@>>>>>>>>>>>>>slideoffset %f, %f", slideOffset.x, slideOffset.y);
}




@end
