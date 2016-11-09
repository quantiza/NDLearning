//
//  NHHeaderOptionItemView.h
//  NH
//
//  Created by yangl on 2016/11/7.
//  Copyright © 2016年 yl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHHeaderOptionItemView : UILabel

/** 填充色，从左开始*/
@property (nonatomic, strong) UIColor *fillColor;
/** 滑动进度*/
@property (nonatomic, assign) CGFloat progress;

@end
