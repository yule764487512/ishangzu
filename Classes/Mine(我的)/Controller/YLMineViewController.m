//
//  YLMineViewController.m
//  ishangzu
//
//  Created by computer on 16/8/15.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLMineViewController.h"
#import "YLMoreSetupViewController.h"
#import "YLLoginViewController.h"
#import "YLButton.h"
#import "YLCouponViewController.h"
#import "YLEditViewController.h"
#import "YLMyTopicViewController.h"
#import "YLIdentityViewController.h"
#import "UINavigationBar+Awesome.h"
#import "YLNavigationController.h"
#import "YLRentalViewController.h"
@interface YLMineViewController ()<YLLoginVCDelegate>

@property (nonatomic,strong)YLLoginViewController * loginVC;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *headBtn;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@end

@implementation YLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    
    self.loginVC=[[YLLoginViewController alloc]init];
    self.loginVC.delegate = self;
//    self.navigationController.navigationBarHidden=YES;
    [self setupEditUserinfo];


}
/** 设置导航栏*/
- (void)setupNavBar
{

    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(moreSetting)];
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   //背景颜色并透明
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

- (void)setupEditUserinfo
{
    if (KuserManager.uid) {
        self.loginView.hidden=YES;
        UILabel *nickLable=[[UILabel alloc]initWithFrame:CGRectMake(8, self.headBtn.bottom+8, appW-16, 20)];
        nickLable.textAlignment=NSTextAlignmentCenter;
        nickLable.textColor=[UIColor whiteColor];
        nickLable.text=KuserManager.nickname;
        nickLable.font=[UIFont systemFontOfSize:14];
        [self.view addSubview:nickLable];
        YLButton *customButton=[YLButton customButton];
        customButton.frame=CGRectMake(0, nickLable.bottom+8, 100, 20);
        customButton.centerX=self.view.centerX;
        [customButton setTitle:@"编辑个人信息" forState:UIControlStateNormal];
        [customButton setImage:[[UIImage imageNamed:@"common_icon_arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [customButton addTarget:self action:@selector(editUserInfo) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:customButton];
        [self.headBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:KuserManager.avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"Z-1"]];
    }
    else {
        self.loginView.hidden=NO;
    }
}
/** 编辑个人信息*/
- (void)editUserInfo
{
    YLEditViewController *editVC=[[YLEditViewController alloc]init];
    [self.navigationController pushViewController:editVC animated:YES ];
//    [self presentViewController:editVC animated:YES completion:nil];
}
/** 更多设置*/
- (void)moreSetting {
    YLMoreSetupViewController *moresetVc= [[YLMoreSetupViewController alloc]init];
    [self.navigationController pushViewController:moresetVc animated:YES ];
//    [self presentViewController:moresetVc animated:YES completion:nil];
}

- (IBAction)headBtnAction {
    if (KuserManager.uid) {
      
    }
    else
    {
        [self.navigationController pushViewController:self.loginVC animated:YES ];

//        [self presentViewController:self.loginVC animated:YES completion:nil];
    }
    

}
/** 立即登录*/
- (IBAction)loginAction {
    
    [self.navigationController pushViewController:self.loginVC animated:YES ];
    
    
}
/** 优惠券*/
- (IBAction)discountCouponAction {
    if (KuserManager.uid) {
        YLCouponViewController *couponVC=[[YLCouponViewController alloc]init];
        [self.navigationController pushViewController:couponVC animated:YES ];
    }
    else
    {
        [self.navigationController pushViewController:self.loginVC animated:YES ];
    }

}
/** 话题*/
- (IBAction)topicAction {
    if (KuserManager.uid) {
        YLMyTopicViewController *mytopicVC=[[YLMyTopicViewController alloc]init];
        [self.navigationController pushViewController:mytopicVC animated:YES ];
    }
    else
    {
        [self.navigationController pushViewController:self.loginVC animated:YES ];
    }

}
/** 合同*/
- (IBAction)agreementAction {
   
    if (KuserManager.uid) {
        YLIdentityViewController *identityVC=[[YLIdentityViewController alloc]init];
        [self.navigationController pushViewController:identityVC animated:YES ];
    }
    else
    {
        [self.navigationController pushViewController:self.loginVC animated:YES ];
    }

}

/** 租住攻略*/
- (IBAction)raidersAction {
    YLRentalViewController *rentalVC=[[YLRentalViewController alloc]init];
    [self.navigationController pushViewController:rentalVC animated:YES ];
}
#pragma mark ---YLLoginVCDelegate
- (void)loginVCDidClickBtn:(UIViewController *)vc
{
    [self setupEditUserinfo];
}
@end
