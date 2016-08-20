//
//  YLHomeViewController.m
//  ishangzu
//
//  Created by computer on 16/8/15.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLHomeViewController.h"
#import "UINavigationBar+Awesome.h"
#import "YLBannerView.h"
#import "BannerModel.h"
@interface YLHomeViewController ()<YLBannerViewDelegate>
@property (nonatomic,strong)NSMutableArray * models;
@end

@implementation YLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self loadData];

}
- (void)loadData
{
    NSDictionary *dict=@{@"recommendPosition":@"003"};
    [HYBNetworking postWithUrl:@"http://appnew.ishangzu.com/api/common/0201" refreshCache:YES params:dict success:^(id response) {
        self.models=[BannerModel mj_objectArrayWithKeyValuesArray:response[@"obj"]];
        YLBannerView *bannerView=[YLBannerView bannerViewWithFrame:CGRectMake(0, 20, appW,190) modelImages:self.models];
        bannerView.delegate=self;
        [self.view addSubview:bannerView];
    } fail:^(NSError *error) {
        
    }];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    //覆盖导航栏的线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
//还原导航栏的设置
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar lt_reset];
}

#pragma mark --YLBannerViewDelegate
- (void)bannerView:(YLBannerView *)bannerView didSelectButtonAtIndex:(NSUInteger *)index
{
    NSLog(@"%ld",index);
}
#pragma mark -- 懒加载
- (NSMutableArray *)models
{
    if (_models==nil) {
        _models=[NSMutableArray array];
    }
    return _models;
}
@end
