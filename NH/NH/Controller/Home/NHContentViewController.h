//
//  NHContentViewController.h
//  NH
//
//  Created by yangl on 2016/11/9.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHBaseTableViewController.h"
#import "NHBaseRequest.h"

@interface NHContentViewController : NHBaseTableViewController

- (instancetype)initWithRequest:(NHBaseRequest *)request;

- (instancetype)initWithUrl:(NSString *)url;

@end
