//
//  YLCouponViewController.m
//  ishangzu
//
//  Created by computer on 16/8/17.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLCouponViewController.h"
#import "MBProgressHUD+MJ.h"
@interface YLCouponViewController ()<UIWebViewDelegate>

@end

@implementation YLCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"优惠券使用帮助";
    // 1.添加webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame =self.view.bounds;
    
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
    //显示提醒框
    [MBProgressHUD showMessage:@"加载中..."];
}

/**
 *  webView请求完毕的时候就会调用
 */
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}
/**
 *  webView请求失败的时候就会调用
 */
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // 隐藏提醒框
    [MBProgressHUD hideHUD];
}



@end
