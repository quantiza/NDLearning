//
//  NHHeaderOptionView.m
//  NH
//
//  Created by yangl on 2016/11/7.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHHeaderOptionView.h"
#import "NHHeaderOptionItemView.h"

@interface NHHeaderOptionView () <UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, assign) NSInteger currentIndex;

@property(nonatomic, strong) CALayer *lineLayer;

@end

@implementation NHHeaderOptionView
//设置偏移量

- (void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    CGFloat offsetX = contentOffset.x;
    //当前索引
    NSInteger index = offsetX / kScreenWidth;
    
    NHHeaderOptionItemView *leftItem = (NHHeaderOptionItemView *)[_scrollView viewWithTag:index + 1];
    NHHeaderOptionItemView *rightItem = (NHHeaderOptionItemView *)[_scrollView viewWithTag:index + 2];
    
    CGFloat rightPageLeftDelta = offsetX - index * kScreenWidth;
    CGFloat progress = rightPageLeftDelta / kScreenWidth;
    
    if ([leftItem isKindOfClass:[NHHeaderOptionItemView class]]) {
        leftItem.textColor = RED_CLOOR;
        leftItem.fillColor = TEXT_COLOR_LEVEL_1;
        leftItem.progress = progress;
    }
    
    if ([rightItem isKindOfClass:[NHHeaderOptionItemView class]]) {
        rightItem.textColor = TEXT_COLOR_LEVEL_1;
        rightItem.fillColor = RED_CLOOR;
        rightItem.progress = progress;
    }
    
    for (NHHeaderOptionItemView *itemView in _scrollView.subviews) {
        if ([itemView isKindOfClass:[NHHeaderOptionItemView class]]) {
            if (itemView.tag != index+1 && itemView.tag != index+2) {
                itemView.textColor = TEXT_COLOR_LEVEL_1;
                itemView.fillColor = RED_CLOOR;
                itemView.progress = 0.0;
            }
        }
    }
    //重置当前索引
    _currentIndex = index;
}

- (void)setTitles:(NSArray *)titles {
    self.backgroundColor = COLOR_WHITE;
    _titles = titles;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-kLineHeight)];
    _scrollView.contentSize = CGSizeMake(60 * _titles.count, _scrollView.height-kLineHeight);
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    //标题
    if (titles.count) {
        for (int i = 0; i < titles.count; i++) {
            NHHeaderOptionItemView *item = [[NHHeaderOptionItemView alloc] initWithFrame:CGRectMake(60 * i, 0, 60, _scrollView.height)];
            item.text = titles[i];
            item.tag = i + 1;
            item.textAlignment = NSTextAlignmentCenter;
            item.userInteractionEnabled = YES;
            [_scrollView addSubview:item];
            [item addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemTapGest:)]];
        }
    }
    
    //分割线
    _lineLayer = [CALayer layer];
    _lineLayer.frame = CGRectMake(0, _scrollView.height-kLineHeight, kScreenWidth, kLineHeight);
    _lineLayer.backgroundColor = RED_CLOOR.CGColor;
    [_scrollView.layer addSublayer:_lineLayer];
}

- (void)itemTapGest:(UITapGestureRecognizer *)tapGest {
    //手势的视图是指使手势触发的对象
//    NSLog(@"Dont touch me.%@",tapGest.view);
    NHHeaderOptionItemView *item = (NHHeaderOptionItemView *)tapGest.view;
    if (item) {
        _homeHeaderOptionalViewItemClickHandle(self, item.text, item.tag - 1);
    }
    _currentIndex = item.tag - 1;
}

@end
