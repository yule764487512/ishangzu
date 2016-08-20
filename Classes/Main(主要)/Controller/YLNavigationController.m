//
//  YLNavigationController.m
//  ishangzu
//
//  Created by computer on 16/8/15.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLNavigationController.h"
#import "UINavigationBar+Awesome.h"
@interface YLNavigationController ()

@end

@implementation YLNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:BaseColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:BaseColor};
    //背景颜色
    [self.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
//    // 设置导航栏  为不透明状态
//    [self.navigationBar setTranslucent:NO];
    //自定义返回按钮
    UIImage *backButtonImage = [[UIImage imageNamed:@"FH-1"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //如果push进来的不是第一个控制器
    if (self.childViewControllers.count > 0) {
     
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //这句super的push要放在后面，让viewController可以覆盖上面设置leftBarButtonItem
    [super pushViewController:viewController animated:YES];
    
}
@end
