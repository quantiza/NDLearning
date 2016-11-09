//
//  NHTopicViewController.h
//  NH
//
//  Created by yangl on 2016/11/7.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHBaseTableViewController.h"
#import "NHFindModel.h"

@interface NHTopicViewController : NHBaseTableViewController

- (instancetype)initWithCatogoryId:(NSInteger)categoryId;

- (instancetype)initWithCategoryElement:(NHFindModel *)element;

@end
