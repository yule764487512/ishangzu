//
//  YLLoginViewController.h
//  ishangzu
//
//  Created by computer on 16/8/16.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YLLoginVCDelegate <NSObject>
@optional
- (void)loginVCDidClickBtn:(UIViewController *)vc;
@end
@interface YLLoginViewController : UIViewController
@property (nonatomic,weak)id<YLLoginVCDelegate> delegate;

@end
