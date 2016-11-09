//
//  NHFindCell.h
//  NH
//
//  Created by yangl on 2016/11/6.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHBaseTableViewCell.h"
#import "NHFindModel.h"

@interface NHFindCell : NHBaseTableViewCell

@property (nonatomic, strong) NSDictionary *elementModel;

- (void)setElementModel:(NSDictionary *)elementModel;


- (UIButton *)orderBtn;
@end
