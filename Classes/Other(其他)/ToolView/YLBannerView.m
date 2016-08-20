//
//  YLBannerView.m
//  BannerView
//
//  Created by computer on 16/7/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "YLBannerView.h"
#import "BannerModel.h"
#import "UIButton+WebCache.h"
#import "UIView+FrameUtil.h"
@interface YLBannerView()<UIScrollViewDelegate>
@property (nonatomic,weak)UIScrollView *scrollView;
@property (nonatomic,weak)UIPageControl *pageControl;
/** 网络图片模型数组*/
@property (nonatomic,strong)NSArray<BannerModel *> *modelImages;

/** 定时器*/
@property (nonatomic,strong)NSTimer *timer;

@end
@implementation YLBannerView

+ (instancetype)bannerViewWithFrame:(CGRect)frame modelImages:(NSArray<BannerModel *> *)modelImages
{
    YLBannerView *bannerView=[[YLBannerView alloc]initWithFrame:frame];
    bannerView.modelImages=modelImages;
    return bannerView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
    
    // scrollView
    //------------------------
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    //分页
    scrollView.pagingEnabled = YES;
    //不设置弹簧效果
    scrollView.bounces = NO;
    //代理
    scrollView.delegate = self;
    //不显示水平滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView=scrollView;
    //添加到父视图
    [self addSubview:scrollView];
        
        
    //-----------------------
    // pageControl
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    
    pageControl.hidesForSinglePage = YES;
    //其他pageControl颜色
    pageControl.pageIndicatorTintColor=[UIColor lightGrayColor];
    //当前pageControl颜色
    pageControl.currentPageIndicatorTintColor=[UIColor redColor];
    pageControl.userInteractionEnabled = NO;
    self.pageControl=pageControl;
    [self addSubview:pageControl];
    }
    [self startTimer];
    return self;
}
//布局子控件
- (void)layoutSubviews
{
    self.scrollView.frame=CGRectMake(0, 0, self.width, self.height);
    self.pageControl.frame=CGRectMake(0, self.height-30, self.width, 30);
}
//添加网络图片按钮
//重写set方法
- (void)setModelImages:(NSArray<BannerModel *> *)modelImages
{
    _modelImages=modelImages;
    UIButton *btn=nil;
    for (NSInteger i=0; i<modelImages.count; i++) {
        btn=[[UIButton alloc]initWithFrame:CGRectMake(i*self.width, 0, self.width, self.height)];
        NSLog(@"%@",NSStringFromCGRect(btn.frame) );
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:modelImages[i].img] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(selectIndexBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i;
        [self.scrollView addSubview:btn];
    }
    //设置滚动范围
    self.scrollView.contentSize=CGSizeMake(modelImages.count*self.width, 0);
    //设置页数
    self.pageControl.numberOfPages=modelImages.count;

}

//启用定时器
- (void)startTimer
{
//    self.timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}
//停用定时器
- (void)stopTimer
{
    [self.timer invalidate];
    self.timer=nil;
}

- (void)nextPage
{
   
    // 1.增加pageControl的页码
    NSInteger page = 0;
    if (self.pageControl.currentPage == self.modelImages.count - 1) {
        page = 0;
    } else {
        page = self.pageControl.currentPage + 1;
    }
    // 2.计算scrollView滚动的位置
    CGFloat offsetX = page * self.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}
- (void)selectIndexBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(bannerView:didSelectButtonAtIndex:)]) {
        [self.delegate bannerView:self didSelectButtonAtIndex:btn.tag];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
 
    self.pageControl.currentPage=(self.scrollView.contentOffset.x+self.width*0.5)/self.width;
    if(self.pageControl.currentPage==self.modelImages.count - 1)
    {
        
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}


@end
