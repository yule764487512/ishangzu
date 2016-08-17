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
@interface YLMineViewController ()

@property (nonatomic,strong)YLLoginViewController * loginVC;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *headBtn;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@end

@implementation YLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginVC=[[YLLoginViewController alloc]init];
    self.navigationController.navigationBarHidden=YES;
    [self setupEditUserinfo];


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
        [customButton setImage:[UIImage imageNamed:@"common_icon_arrow"] forState:UIControlStateNormal];
        [self.view addSubview:customButton];
        
    }
    else {
        self.loginView.hidden=NO;
    }
}
/** 更多设置*/
- (IBAction)moreSetting {
    YLMoreSetupViewController *moresetVc= [[YLMoreSetupViewController alloc]init];
    [self presentViewController:moresetVc animated:YES completion:nil];
}

- (IBAction)headBtnAction {
    if (KuserManager.uid) {
      
    }
    else
    {
        [self presentViewController:self.loginVC animated:YES completion:nil];
    }
    

}
/** 立即登录*/
- (IBAction)loginAction {
    if (KuserManager.uid) {
        
    }
    else
    {
        [self presentViewController:self.loginVC animated:YES completion:nil];
    }
    
}
/** 优惠券*/
- (IBAction)discountCouponAction {
    if (KuserManager.uid) {
        YLCouponViewController *couponVC=[[YLCouponViewController alloc]init];
        [self presentViewController:couponVC animated:YES completion:nil];
    }
    else
    {
        [self presentViewController:self.loginVC animated:YES completion:nil];
    }

}
/** 话题*/
- (IBAction)topicAction {
    if (KuserManager.uid) {
        
    }
    else
    {
        [self presentViewController:self.loginVC animated:YES completion:nil];
    }

}
/** 合同*/
- (IBAction)agreementAction {
   
    if (KuserManager.uid) {
        
    }
    else
    {
        [self presentViewController:self.loginVC animated:YES completion:nil];
    }

}

/** 租住攻略*/
- (IBAction)raidersAction {
}

@end
