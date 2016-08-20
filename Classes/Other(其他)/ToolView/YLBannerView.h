//
//  YLBannerView.h
//  BannerView
//
//  Created by computer on 16/7/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BannerModel;
@class YLBannerView;
@protocol YLBannerViewDelegate <NSObject>

@optional
/** 点击了banner按钮调用这个方法*/
- (void)bannerView:(YLBannerView *)bannerView didSelectButtonAtIndex:(NSUInteger *)index;

@end
@interface YLBannerView : UIView
@property (nonatomic,weak)id<YLBannerViewDelegate> delegate;
+ (instancetype)bannerViewWithFrame:(CGRect)frame modelImages:(NSArray<BannerModel *> *)modelImages;
@end
