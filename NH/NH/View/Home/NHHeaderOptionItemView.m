//
//  NHHeaderOptionItemView.m
//  NH
//
//  Created by yangl on 2016/11/7.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHHeaderOptionItemView.h"

@implementation NHHeaderOptionItemView

//滑动进度
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [_fillColor set];
    
    CGRect newRect = rect;
    newRect.size.width = rect.size.width * _progress;
    UIRectFillUsingBlendMode(newRect, kCGBlendModeSourceIn);
}

@end
