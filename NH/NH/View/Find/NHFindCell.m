//
//  NHFindCell.m
//  NH
//
//  Created by yangl on 2016/11/6.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHFindCell.h"

@interface NHFindCell()
/** 头像*/
@property (nonatomic, strong) UIImageView *iconImg;
/** 名字*/
@property (nonatomic, strong) UILabel *nameL;
/** 内容*/
@property (nonatomic, strong) UILabel *contentL;
/** 订阅数*/
@property (nonatomic, strong) UILabel *orderCountL;
/** 总贴数*/
@property (nonatomic, strong) UILabel *totalCountL;
/** 订阅*/
@property (nonatomic, strong) UIButton *orderBtn;

/** 分割线*/
@property (nonatomic, strong) CALayer *lineLayer;
/** 关键字*/
@property (nonatomic, copy) NSString *keyWord;

@end


@implementation NHFindCell


#pragma mark 使用set方法为cell上的控件添加数据
- (void)setElementModel:(NSDictionary*)elementModel {
    
    NHFindModel *findModel = [[NHFindModel alloc] initWithDictionary:elementModel];
//    [self.iconImg setImage:[UIImage imageNamed:@"iosbar"]];
    [self.iconImg sd_setImageWithURL:[NSURL URLWithString:[findModel iconImgStr]]];
    self.nameL.text = [findModel nameStr];
    self.contentL.text = [findModel contentStr];
    self.orderCountL.text = [NSString stringWithFormat:@"%@ 订阅", [findModel orderCountStr]];
    NSString *totalText =  [NSString stringWithFormat:@"总贴数 %@", [findModel totalCountStr]];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:totalText];
    NSRange range = [totalText rangeOfString:@"总贴数 "];
    if (range.location != NSNotFound) {
        NSRange countRange = NSMakeRange(range.length, totalText.length - range.length);
        [string addAttribute:NSFontAttributeName value:kFont(12) range:NSMakeRange(0, string.length)];
//        [string addAttribute:NSForegroundColorAttributeName value:kDiscoverTextColor range:range];
        [string addAttribute:NSForegroundColorAttributeName value:kCommonHighLightRedColor range:countRange];
        self.totalCountL.attributedText = string;
    }
    [self orderBtn];
}

#pragma mark 通过get方法为cell添加控件
- (UIImageView *)iconImg {
    if (!_iconImg) {
        _iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 45, 45)];
        [_iconImg setImage:[UIImage imageNamed:@"iosbar"]];
        _iconImg.layer.cornerRadius = 3.0;
        _iconImg.layer.masksToBounds = YES;
        [self.contentView addSubview:_iconImg];
    }
    return _iconImg;
}

- (UILabel *)nameL {
    if (!_nameL) {
        _nameL = [[UILabel alloc] initWithFrame:CGRectMake(75, 15, 220, 15)];
        _nameL.font = kFont(16);
        _nameL.textColor = TEXT_COLOR_LEVEL_1;
        [self.contentView addSubview:_nameL];
    }
    return _nameL;
}

- (UILabel *)contentL {
    if (!_contentL) {
        _contentL = [[UILabel alloc] initWithFrame:CGRectMake(75, 40, 220, 15)];
        _contentL.font = kFont(12);
        _contentL.textColor = TEXT_COLOR_LEVEL_3;
        [self.contentView addSubview:_contentL];
    }
    return _contentL;
}

- (UILabel *)orderCountL {
    if (!_orderCountL) {
        _orderCountL = [[UILabel alloc] initWithFrame:CGRectMake(75, 60, 75, 15)];
        _orderCountL.font = kFont(12);
        _orderCountL.textColor = TEXT_COLOR_LEVEL_3;
        [self.contentView addSubview:_orderCountL];
    }
    return _orderCountL;
}

- (UILabel *)totalCountL {
    if (!_totalCountL) {
        _totalCountL = [[UILabel alloc] initWithFrame:CGRectMake(165, 60, 100, 15)];
        _totalCountL.font = kFont(12);
        _totalCountL.textColor = TEXT_COLOR_LEVEL_3;
        [self.contentView addSubview:_totalCountL];
    }
    return _totalCountL;
}

- (CALayer *)lineLayer {
    return _lineLayer;
}

- (NSString *)keyWord {
    return _keyWord;
}

- (UIButton *)orderBtn {
    if (!_orderBtn) {
        _orderBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _orderBtn.frame = CGRectMake(kScreenWidth-65, 25, 50, 25);
        _orderBtn.backgroundColor = kClearColor;
        [_orderBtn setTitle:@"订阅" forState:UIControlStateNormal];
        _orderBtn.layer.cornerRadius = 5.0;
//        _orderBtn.layer.borderColor = RED_CLOOR.CGColor;
        _orderBtn.layer.borderWidth = 0.5;
        [_orderBtn setTitleColor:TEXT_COLOR_LEVEL_3 forState:UIControlStateNormal];
        _orderBtn.titleLabel.font = kFont(13);
        [self.contentView addSubview:_orderBtn];
        //添加订阅按钮点击事件
    }
    return _orderBtn;
}











@end
