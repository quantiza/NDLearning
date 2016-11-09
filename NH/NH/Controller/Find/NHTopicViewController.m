//
//  NHTopicViewController.m
//  NH
//
//  Created by yangl on 2016/11/7.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHTopicViewController.h"
#import "NHTopicRequest.h"

@interface NHTopicViewController ()

@property(nonatomic,assign) NSInteger categoryId;

@property(nonatomic,strong) NHFindModel *element;

@end

@implementation NHTopicViewController

- (instancetype)initWithCatogoryId:(NSInteger)categoryId {
    self = [super init];
    if (self) {
        _categoryId = categoryId;
    }
    return self;
}

- (instancetype)initWithCategoryElement:(NHFindModel *)element {
    self = [super init];
    if (self) {
        _element = element;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.tableView.backgroundColor = ORANGE_COLOR;
    if (_element.nameStr) {
        self.navigationItem.title = _element.nameStr;
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(rightItemClick)];
}

- (void)rightItemClick {
    NSLog(@">>>>>>>>>>>>>>>Dont touch me.");
}

- (void)loadData {
    [super loadData];
    NHTopicRequest *request = [[NHTopicRequest alloc] init];
}










@end
