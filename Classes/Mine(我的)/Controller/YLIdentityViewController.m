//
//  YLIdentityViewController.m
//  ishangzu
//
//  Created by computer on 16/8/18.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLIdentityViewController.h"

@interface YLIdentityViewController ()
//阴影
@property (nonatomic,weak)UIButton *cover;
@end

@implementation YLIdentityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"身份验证";
    self.automaticallyAdjustsScrollViewInsets=NO;
   UIBarButtonItem *commitBtn=[[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:nil];
    [commitBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=commitBtn;
}



@end
