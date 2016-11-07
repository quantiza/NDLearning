//
//  NHFindHeadView.m
//  NH
//
//  Created by yangl on 2016/11/5.
//  Copyright © 2016年 yl. All rights reserved.
/**
 此处通过scrollView和pageControl实现了轮播图
 1.需注意，pageControl的点击事件用upinside，这样可以在首位继续触发事件，然后判断是否处于首位状态，然后进行跳转
 2.scrollView使用首尾各加一副image的方式实现
 */

#import "NHFindHeadView.h"
#import "NHFindModel.h"

@interface NHFindHeadView() <UIScrollViewDelegate>

@property(nonatomic,strong) UIPageControl *pageControl;


@end

@implementation NHFindHeadView {
    NSInteger lastPage;
    NSInteger nowPage;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        nowPage = 0;
        lastPage = 0;
        [self initViews];
    }
    return self;
}

- (void)initViews {
    self.backgroundColor = kPurpleColor;
}


- (void)bannerShow:(NSMutableArray *)bannerArray {
    UIScrollView *bannerSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
    bannerSV.contentSize = CGSizeMake(kScreenWidth*(bannerArray.count+2), 180);
    [bannerSV setContentOffset:CGPointMake(kScreenWidth, bannerSV.contentOffset.y)];
    bannerSV.tag = 101;
    bannerSV.pagingEnabled = YES;
    bannerSV.bounces = NO;
    bannerSV.showsHorizontalScrollIndicator = NO;
    bannerSV.delegate = self;
    
    for (int i=0; i<bannerArray.count; i++) {
        NHFindModel *bannerUrlModel = [[NHFindModel alloc] initWithDictionary:bannerArray[i]];
        UIImageView *bannerImage = [[UIImageView alloc] initWithFrame:CGRectMake((i+1)*kScreenWidth, 0, kScreenWidth, 180)];
        [bannerImage sd_setImageWithURL:[NSURL URLWithString:[bannerUrlModel bannerStr]]];
        [bannerSV addSubview:bannerImage];
    }
    
    UIImageView *bannerBeginImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
    [bannerBeginImage sd_setImageWithURL:[NSURL URLWithString:[[[NHFindModel alloc] initWithDictionary:bannerArray[bannerArray.count-1]] bannerStr]]];
    [bannerSV addSubview:bannerBeginImage];
    
    UIImageView *bannerEndImage = [[UIImageView alloc] initWithFrame:CGRectMake((bannerArray.count+1)*kScreenWidth, 0, kScreenWidth, 180)];
    [bannerEndImage sd_setImageWithURL:[NSURL URLWithString:[[[NHFindModel alloc] initWithDictionary:bannerArray[0]] bannerStr]]];

    [bannerSV addSubview:bannerEndImage];
    
    [self addSubview:bannerSV];
    [self pageControl:(bannerArray.count)];
}


- (void)pageControl:(NSInteger)pageNum {
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenWidth - 100, self.frame.size.height - 20, 100, 20)];
    [_pageControl setPageIndicatorTintColor:ORANGE_COLOR];
    [_pageControl setCurrentPageIndicatorTintColor:kRedColor];
    [_pageControl setNumberOfPages:pageNum];          //必须要设置页数否则不出现内容
    [self addSubview:_pageControl];
    
    [_pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) pageChange:(UIPageControl *)pageC {
    UIScrollView *scrollV = (UIScrollView *)[self viewWithTag:101];
    lastPage = nowPage;
    nowPage = pageC.currentPage;
    
    if (labs(nowPage-lastPage)>1) {
        if (nowPage == _pageControl.numberOfPages-1) {
            if (lastPage == nowPage || lastPage == 0) {
                _pageControl.currentPage = 0;
            }
        }
        
        if (nowPage == 0) {
            if (lastPage == nowPage || lastPage == _pageControl.numberOfPages-1) {
                _pageControl.currentPage = _pageControl.numberOfPages - 1;
            }
        }
    }
    
    [scrollV setContentOffset:CGPointMake(kScreenWidth * (pageC.currentPage+1), scrollV.y)];
}

#pragma mark scrollView代理

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int current = scrollView.contentOffset.x/kScreenWidth;
    NSLog(@"========pageCount=%ld, current=%d", _pageControl.numberOfPages, current);
    if (current == _pageControl.numberOfPages+1) {
        [scrollView setContentOffset:CGPointMake(kScreenWidth, scrollView.contentOffset.y)];
        _pageControl.currentPage = 0;
    } else if (current == 0) {
        [scrollView setContentOffset:CGPointMake(kScreenWidth*_pageControl.numberOfPages, scrollView.contentOffset.y)];
        _pageControl.currentPage = _pageControl.numberOfPages-1;
    }
    else {
        _pageControl.currentPage = current-1;
    }
}

@end
