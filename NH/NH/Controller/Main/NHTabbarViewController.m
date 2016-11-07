//
//  NHTabbarViewController.m
//  NH
//
//  Created by yangl on 2016/11/4.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "NHTabbarViewController.h"
#import "NHBaseNavigationViewController.h"
#import "NHHomeViewController.h"
#import "NHFindViewController.h"

@interface NHTabbarViewController ()

@end

@implementation NHTabbarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];
}

- (void)initLayout {
    self.tabBar.backgroundColor = BG_GRAY_COLOR;     //设置bar的背景色
    self.tabBar.tintColor = RED_CLOOR;               //设置文字图片点选中色，默认蓝色
    [[UITabBarItem appearance]setTitlePositionAdjustment:UIOffsetMake(0, 0)];  //设置工具栏中文字的偏移量
    [self addChildViewControllerWithClassname:[NHHomeViewController description] imageNme:@"home" title:@"首页"];
    [self addChildViewControllerWithClassname:[NHFindViewController description] imageNme:@"Found" title:@"发现"];
    [self addChildViewControllerWithClassname:@"NHHomeViewController" imageNme:@"home" title:@"首页"];
    [self addChildViewControllerWithClassname:@"NHHomeViewController" imageNme:@"home" title:@"首页"];

}



// 添加子控制器
- (void)addChildViewControllerWithClassname:(NSString *)className imageNme:(NSString *)imageName title:(NSString *)title {
    //创建nav
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    NHBaseNavigationViewController *nav = [[NHBaseNavigationViewController alloc] initWithRootViewController:vc];
    //创建nav的tabbar item
    UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imageName] selectedImage:[UIImage imageNamed:[imageName stringByAppendingString:@"_press"]]];
    nav.tabBarItem = tabbarItem;

    [self addChildViewController:nav];
}

@end
