//
//  NHServiceDataModel.h
//  NH
//
//  Created by yangl on 2016/11/9.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHBaseModel.h"

typedef NS_ENUM(NSUInteger, NHDataElementMediaType) {
    /** 大图*/
    NHDataElementMediaTypeLargeImage = 1,
    /** Gif图片*/
    NHDataElementMediaTypeGif = 2,
    /** 视频*/
    NHDataElementMediaTypeVideo = 3,
    /** 小图*/
    NHDataElementMediaTypeLittleImages = 4,
    /** 精华*/
    NHDataElementMediaTypeEssence = 5,
};

@class NHDataElement, NHDataElementGroup;


@interface NHServiceDataModel : NHBaseModel

@property (nonatomic) BOOL has_more;
@property (nonatomic) float min_time;
@property (nonatomic) float max_time;
@property (nonatomic, copy) NSString *tip;
@property (nonatomic, strong) NSMutableArray<NHDataElement *> *data;

@end


@interface NHDataElement : NHBaseModel

@property (nonatomic, strong) NHDataElementGroup *group;

@end


@interface NHDataElementGroup : NHBaseModel

@property (nonatomic, assign) NSInteger category_id;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, assign) NHDataElementMediaType media_type;


@end











