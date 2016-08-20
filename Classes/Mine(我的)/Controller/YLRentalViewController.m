//
//  YLRentalViewController.m
//  ishangzu
//
//  Created by computer on 16/8/18.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLRentalViewController.h"

@interface YLRentalViewController ()

@end

@implementation YLRentalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"入住须知";
    // 1.添加webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    //加载webView
    NSURL *url=[NSURL URLWithString:@"http://m.ishangzu.com/data/stayInfo"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}





@end
