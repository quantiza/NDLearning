//
//  NHFindModel.h
//  NH
//
//  Created by yangl on 2016/11/6.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHBaseModel.h"

@interface NHFindModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSMutableArray *)bannersList;

- (NSString *)bannerStr;



- (NSMutableArray *)categoryList;

- (NSString *)iconImgStr;

- (NSString *)nameStr;

- (NSString *)contentStr;

- (NSString *)orderCountStr;

- (NSString *)totalCountStr;

@end

