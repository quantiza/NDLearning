//
//  NHHotViewController.m
//  NH
//
//  Created by yangl on 2016/11/5.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHHotViewController.h"
#import "NHFindHeadView.h"
#import "NHBaseRequest.h"
#import "NHFindModel.h"
#import "NHFindCell.h"

@interface NHHotViewController ()


/** 轮播图数据数组*/
@property (nonatomic, strong) NSMutableArray *bannerImgArray;

@property(nonatomic,strong) NHFindHeadView *headerView;

@end

@implementation NHHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpViews];//初始化视图
    [self loadData];    //请求数据
}

#pragma mark 初始化视图
- (void)setUpViews {
    self.sepLineColor = TEXT_COLOR_LEVEL_5;
    self.refreshType = NHBaseTableVcRefreshTypeRefreshAndLoadMore;
    [self headerView];
}

#pragma mark 头部轮播图
- (NHFindHeadView *)headerView {
    if (!_headerView) {
        _headerView = [[NHFindHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
    }
    self.tableView.tableHeaderView = _headerView;
    return _headerView;
}

#pragma mark 请求数据
//注意这里是http请求需要在plist里增加安全随意字段
- (void)loadData {
    [super loadData];
    NHBaseRequest *request = [NHBaseRequest nh_request];
    request.nh_url = kNHDiscoverHotListAPI;
    [request nh_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            NSLog(@"=======sucess");
            NHFindModel *findModel = [[NHFindModel alloc] initWithDictionary:response];
            
            self.bannerImgArray = [findModel bannersList];
            if (_bannerImgArray.count) {
                NSLog(@"=======isHaveBanner");
                [_headerView bannerShow:_bannerImgArray];
            }
            
            self.dataArray = [findModel categoryList];
            [self.tableView reloadData];
        }
    }];
}


#pragma mark UITableViewDelegate
//代理的所有值默认都是0
- (NSInteger)nh_numberOfSections {
    return 1;
}

- (NSInteger)nh_numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)nh_cellheightAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (NHFindCell *)nh_cellAtIndexPath:(NSIndexPath *)indexPath {
    NHFindCell *cell = [NHFindCell cellWithTableView:self.tableView];
//    if (_dataArray.count==0) {
//        return cell;
//    }
    cell.elementModel = self.dataArray[indexPath.row];
    return cell;
}




@end
