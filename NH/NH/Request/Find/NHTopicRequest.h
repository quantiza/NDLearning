//
//  NHTopicRequest.h
//  NH
//
//  Created by yangl on 2016/11/7.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHBaseRequest.h"

@interface NHTopicRequest : NHBaseRequest

@property (nonatomic, assign) NSInteger category_id;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger mpic;;
@property (nonatomic, assign) NSInteger message_cursor;


- (instancetype)init;

@end
