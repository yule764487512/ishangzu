//
//  YLNavigationController.m
//  ishangzu
//
//  Created by computer on 16/8/15.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLNavigationController.h"

@interface YLNavigationController ()

@end

@implementation YLNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
 
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
