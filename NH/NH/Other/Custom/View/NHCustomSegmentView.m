//
//  NHCustomSegmentView.m
//  NeiHan
//
//  Created by Charles on 16/8/30.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import "NHCustomSegmentView.h"
#import "UIView+Layer.h"

@implementation NHCustomSegmentView {
    NSArray *_itemTitles;
    UIButton *_selectedBtn;
}

- (instancetype)initWithItemTitles:(NSArray *)itemTitles {
    if (self = [super init]) {
        _itemTitles = itemTitles;
        
        self.layerCornerRadius = 3.0;
        self.layerBorderColor = [UIColor colorWithRed:220.0/255 green:221.0/255 blue:222.0/255  alpha:0.5];
        self.layerBorderWidth = 5.0;
        
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews {
    
    if (_itemTitles.count > 0) {
        NSInteger i = 0;
        for (id obj in _itemTitles) {
            if ([obj isKindOfClass:[NSString class]]) {
                NSString *objStr = (NSString *)obj;
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [self addSubview:btn];
                btn.backgroundColor = RED_CLOOR;
                [btn setTitle:objStr forState:UIControlStateNormal];
                [btn setTitleColor:RED_CLOOR forState:UIControlStateSelected];
                [btn setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
                btn.titleLabel.font = kFont(16);
                i = i + 1;
                btn.tag = i;
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                btn.adjustsImageWhenDisabled = NO;
                btn.adjustsImageWhenHighlighted = NO;
            }
        }
    }
}


- (void)clickDefault {
    if (_itemTitles.count == 0) {
        return ;
    }
    //设置默认点击的按钮，此处默认点击第一个按钮
    [self btnClick:(UIButton *)[self viewWithTag:1]];
}



- (void)btnClick:(UIButton *)btn {
    
    
    _selectedBtn.backgroundColor = RED_CLOOR;
    btn.backgroundColor = COLOR_WHITE;
    
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    
    NSString *title = btn.currentTitle;
    if (self.NHCustomSegmentViewBtnClickHandle) {
        self.NHCustomSegmentViewBtnClickHandle(self, title, btn.tag - 1);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_itemTitles.count > 0) {
        CGFloat btnW = self.width / _itemTitles.count;
        for (int i = 0 ; i < _itemTitles.count; i++) {
            UIButton *btn = (UIButton *)[self viewWithTag:i + 1];
            btn.frame = CGRectMake(btnW * i, 0, btnW, self.height);
        }
    }
}


@end
