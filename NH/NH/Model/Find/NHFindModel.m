//
//  NHFindModel.m
//  NH
//
//  Created by yangl on 2016/11/6.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHFindModel.h"

@interface NHFindModel()
@property(nonatomic,strong) NSMutableArray *bannersList;
@property(nonatomic,strong) NSString *bannerStr;

@property(nonatomic,strong) NSMutableArray *categoryList;
@property(nonatomic,strong) NSString *iconImgStr;
@property(nonatomic,strong) NSString *nameStr;
@property(nonatomic,strong) NSString *contentStr;
@property(nonatomic,strong) NSString *orderCountStr;
@property(nonatomic,strong) NSString *totalCountStr;

@end

@implementation NHFindModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self && [dict isKindOfClass:[NSDictionary class]] && dict!=nil && dict!=NULL) {
        //轮播图数组
        _bannersList = [[dict objectForKey:@"rotate_banner"] objectForKey:@"banners"];
        //轮播图url
        _bannerStr = [[[[dict objectForKey:@"banner_url"] objectForKey:@"url_list"] objectAtIndex:0] objectForKey:@"url"];
        //cell数组
        _categoryList = [[dict objectForKey:@"categories"] objectForKey:@"category_list"];
        //cell数组中所需键值
        _iconImgStr = [dict objectForKey:@"icon_url"];
        _nameStr = [dict objectForKey:@"name"];
        _contentStr = [dict objectForKey:@"intro"];
        _orderCountStr = [dict objectForKey:@"subscribe_count"];
        _totalCountStr = [dict objectForKey:@"total_updates"];
    }
    return self;
}

- (NSMutableArray *)bannersList {
    return _bannersList;
}

- (NSString *)bannerStr {
    return _bannerStr;
}

- (NSMutableArray *)categoryList {
    return _categoryList;
}

- (NSString *)iconImgStr {
    return _iconImgStr;
}

- (NSString *)nameStr {
    return _nameStr;
}

- (NSString *)contentStr {
    return _contentStr;
}

- (NSString *)orderCountStr {
    return _orderCountStr;
}

- (NSString *)totalCountStr {
    return _totalCountStr;
}


@end
