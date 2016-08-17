//
//  YLTabBarController.m
//  ishangzu
//
//  Created by computer on 16/8/15.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLTabBarController.h"
#import "YLHomeViewController.h"
#import "YLFindHouseViewController.h"
#import "YLDiscoveryViewController.h"
#import "YLMessageViewController.h"
#import "YLMineViewController.h"
#import "YLNavigationController.h"
#import "YLTabBar.h"
@interface YLTabBarController ()

@end

@implementation YLTabBarController
+(void)initialize {
   
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setChildController:[[YLHomeViewController alloc] init] title:@"首页" image:@"A-1" selectedImage:@"A-11"];
    [self setChildController:[[YLFindHouseViewController alloc] init] title:@"找房" image:@"B-1" selectedImage:@"B-11"];
    [self setChildController:[[YLDiscoveryViewController alloc] init] title:@"发现" image:@"C-1" selectedImage:@"C-11"];
    [self setChildController:[[YLMessageViewController alloc] init] title:@"消息" image:@"D-1" selectedImage:@"D-11"];
    [self setChildController:[[YLMineViewController alloc] init] title:@"我的" image:@"F-1" selectedImage:@"F-11"];
   
}
-(void)setChildController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    //设置文字和图片
  
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    //包装一个导航控制器，添加导航控制器为tabbarController的子控制器
    YLNavigationController *nav = [[YLNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
