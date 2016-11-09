//
//  NHServiceListModel.h
//  NH
//
//  Created by yangl on 2016/11/9.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHBaseModel.h"

@interface NHServiceListModel : NHBaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger refresh_interval;

@end
