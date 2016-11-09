//
//  NHContentViewController.m
//  NH
//
//  Created by yangl on 2016/11/9.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHContentViewController.h"
#import "UIViewController+Loading.h"
#import "NHServiceDataModel.h"
#import "NHTopTipView.h"

@interface NHContentViewController ()

@property (nonatomic, strong) NHBaseRequest *request;
@property (nonatomic, copy) NSString *url;
//@property (nonatomic, strong) NSMutableArray *cellFrameArray;
/** 提示视图*/
//@property (nonatomic, strong) NHTopTipView *topTipView;
//@property (nonatomic, assign) BOOL showTopTipViewFlag;


@end

@implementation NHContentViewController

#pragma mark    传request参数构造方法
- (instancetype)initWithRequest:(NHBaseRequest *)request {
    self = [super init];
    if (self) {
        _request = request;
    }
    return self;
}
#pragma mark    传url参数构造方法
- (instancetype)initWithUrl:(NSString *)url {
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //分割线
    self.needCellSepLine = YES;
    self.sepLineColor = RED_CLOOR;
    //刷新icon
    self.showRefreshIcon = YES;
    //刷新加载更多
    self.refreshType = NHBaseTableVcRefreshTypeOnlyCanLoadMore;
    
    [self showLoadingView];
    if (_url.length) {
        NHBaseRequest *request = [[NHBaseRequest alloc] init];
        request.nh_url = self.url;
        _request = request;
        [self loadData];
    } else {
        [self loadData];
    }
}

- (void)nh_refresh {
    [super nh_refresh];
    [self loadData];
}


- (void)loadData {
    if (!_request) return;
    [_request nh_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            //如果加载成功隐藏loading视图，停止refresh动画
            [self hideLoadingView];
            [self endRefreshIconAnimation];
            
            NHServiceDataModel *model = [NHServiceDataModel modelWithDictionary:response];
//            [_dataArray removeAllObjects];
//            
//            for (int i = 0; i < model.data.count; i++) {
//                NHDataElement *element = model.data[i];
//
//                if (element.group) {
//                    [_dataArray addObject:model.data[i]];
//                }
//            }
            [self.tableView reloadData];
        }
    }];
}



#pragma mark    tableView代理
- (NSInteger)nh_numberOfSections {
    return 1;
}

- (NSInteger)nh_numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (NHBaseTableViewCell *)nh_cellAtIndexPath:(NSIndexPath *)indexPath {
    NHBaseTableViewCell *cell = [[NHBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"hello";
    return cell;
}




@end
