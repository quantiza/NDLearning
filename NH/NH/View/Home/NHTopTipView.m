//
//  NHTopTipView.m
//  NH
//
//  Created by yangl on 2016/11/9.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHTopTipView.h"

@interface NHTopTipView ()

@property (nonatomic, strong) UILabel *tipL;

@end


@implementation NHTopTipView

- (void)setTipStr:(NSString *)tipStr {
    if (tipStr) {
        _tipStr = tipStr;
        
        _tipL = [[UILabel alloc] init];
        _tipL.text = tipStr;
        _tipL.textColor = kWhiteColor;
        _tipL.backgroundColor = RED_CLOOR;
        _tipL.textAlignment = NSTextAlignmentCenter;
        _tipL.font = kFont(12);
        [_tipL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
}


@end
