//
//  YLLoginViewController.m
//  ishangzu
//
//  Created by computer on 16/8/16.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLLoginViewController.h"

@interface YLLoginViewController ()<UITextFieldDelegate>
/** 获取验证码*/
@property (weak, nonatomic) IBOutlet UIButton *getSecurityBtn;
/** 登录*/
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *securityTextField;
@property (nonatomic,assign)NSInteger seconds;
@property (nonatomic,strong)NSTimer * timer;
@property (weak, nonatomic) IBOutlet UILabel *alertLable;

@end

@implementation YLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.getSecurityBtn.userInteractionEnabled=NO;
    self.loginBtn.userInteractionEnabled=NO;

}

/** 监听手机号码值改变*/
- (IBAction)phoneTextFieldChange {
    if (self.phoneNumTextField.text.length==11) {
        self.getSecurityBtn.titleLabel.textColor=[UIColor redColor];
         self.getSecurityBtn.userInteractionEnabled=YES;
    }
    else
    {
        self.getSecurityBtn.titleLabel.textColor=[UIColor darkGrayColor];
        self.getSecurityBtn.userInteractionEnabled=NO;
    }
}
/** 监听获取验证码值改变*/
- (IBAction)securityTextFieldChange {
    if (self.securityTextField.text.length==4) {
        self.loginBtn.backgroundColor=[UIColor redColor];
        self.loginBtn.userInteractionEnabled=YES;
    }
    else
    {
        self.loginBtn.backgroundColor=[UIColor lightGrayColor];
        self.loginBtn.userInteractionEnabled=NO;
    }
}

- (void)startCountDown
{
    _seconds = 30;
    NSString *str = [NSString stringWithFormat:@"已发送(%ld s)", _seconds];
    [self.getSecurityBtn setTitle:str forState:UIControlStateDisabled];
    [self.getSecurityBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self.getSecurityBtn setEnabled:NO];
    self.timer = [NSTimer timerWithTimeInterval:1
                                          target:self
                                        selector:@selector(oneSecondPass)
                                        userInfo:nil
                                         repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}
- (void)oneSecondPass
{
    if (_seconds > 0)
    {
        _seconds = _seconds - 1;
        NSString *str = [NSString stringWithFormat:@"已发送(%ld s)", _seconds];
        [self.getSecurityBtn setTitle:str forState:UIControlStateDisabled];
    } else {
        [self.timer invalidate];
        self.timer = nil;
        [self.getSecurityBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [self.getSecurityBtn setEnabled:YES];
        
    }
}
/** 取消*/
- (IBAction)cancelAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/** 获取验证码*/
- (IBAction)getSecurityAction {
    [self startCountDown];
    NSDictionary *dict=@{@"phone":self.phoneNumTextField.text};
    [HYBNetworking postWithUrl:@"http://appnew.ishangzu.com/api/common/0102" refreshCache:YES params:dict success:^(id response) {
        if ([response[@"msg"] isEqualToString:@"成功"])
        {
            self.alertLable.hidden=YES;
        }
        else
        {
            self.alertLable.hidden=NO;
            self.alertLable.text=@"手机号输入错误";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.alertLable.hidden=YES;
            });
        }
    } fail:^(NSError *error) {
        
    }];
}
- (IBAction)loginAction {
    

    NSDictionary *dict=@{@"phone":self.phoneNumTextField.text,@"captcha":self.securityTextField.text};
    [HYBNetworking postWithUrl:@"http://appnew.ishangzu.com/api/common/0103" refreshCache:YES params:dict success:^(id response) {
        if ([response[@"msg"] isEqualToString:@"成功"]) {
            
            YLUser *user=[YLUser mj_objectWithKeyValues:response[@"obj"][@"userInfo"]];
            user.token=[YLUser mj_objectWithKeyValues:response[@"obj"]].token;
            self.alertLable.hidden=YES;
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            self.alertLable.hidden=NO;
            self.alertLable.text=@"验证码错误，请重试";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.alertLable.hidden=YES;
            });
        } 

    } fail:^(NSError *error) {
        
    }];
}

@end
