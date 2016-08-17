//
//  YLCouponViewController.m
//  ishangzu
//
//  Created by computer on 16/8/17.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLCouponViewController.h"

@interface YLCouponViewController ()<UIWebViewDelegate,MBProgressHUDDelegate>

@end

@implementation YLCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupWebView];
    
}
- (void)setupWebView
{

    //返回按钮
    UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectMake(8 , 28, 20, 20)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"FH-1"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    //标题
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(8, 28, 200, 22)];
    title.centerX=self.view.centerX;
    title.text=@"优惠券使用帮助";
    title.textAlignment=NSTextAlignmentCenter;
    title.font=[UIFont systemFontOfSize:17];
    [self.view addSubview:title];
    //分割线
    UIView *separate=[[UIView alloc]initWithFrame:CGRectMake(0, 63, appW, 1)];
    separate.backgroundColor=[UIColor colorWithWhite:0.667 alpha:0.700];
    [self.view addSubview:separate];
    // 1.添加webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 64, appW, appH-64);
    
    webView.delegate = self;
    [self.view addSubview:webView];
    //加载webView
    NSURL *url=[NSURL URLWithString:@"http://m.ishangzu.com/AppCoupons/Help"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
#pragma mark - webView代理方法
/**
 *  webView开始发送请求的时候就会调用
 */
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // 显示提醒框
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText=@"请稍等";
    HUD.delegate=self;
    
}

/**
 *  webView请求完毕的时候就会调用
 */
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 隐藏提醒框
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
/**
 *  webView请求失败的时候就会调用
 */
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // 隐藏提醒框
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
#pragma mark --MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [hud removeFromSuperview];
    hud = nil;
}
/** 返回*/
- (void)backAction
{
        [self dismissViewControllerAnimated:YES completion:nil];
}

@end
