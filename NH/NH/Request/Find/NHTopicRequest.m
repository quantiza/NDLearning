//
//  NHTopicRequest.m
//  NH
//
//  Created by yangl on 2016/11/7.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHTopicRequest.h"

@implementation NHTopicRequest


- (instancetype)init {
    self = [super init];
    if (self) {
        [self initRequest];
    }
    return self;
}


- (void)initRequest {
    self.nh_url = kNHHomeCategoryDynamicListAPI;
    self.count = 30;
    self.level = 6;
    self.message_cursor = 0;
    self.mpic = 1;
    
}

@end
