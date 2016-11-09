//
//  NHHeaderOptionView.h
//  NH
//
//  Created by yangl on 2016/11/7.
//  Copyright © 2016年 yl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHHeaderOptionView : UIView

//标题组
@property(nonatomic, strong) NSArray <NSString *> *titles;
//偏移量
@property(nonatomic, assign) CGPoint contentOffset;
//点击item回调
@property(nonatomic, copy) void(^homeHeaderOptionalViewItemClickHandle)(NHHeaderOptionView *optionView, NSString *title, NSInteger index);

@end
