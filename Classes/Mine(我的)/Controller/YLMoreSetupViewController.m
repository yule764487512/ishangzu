//
//  YLMoreSetupViewController.m
//  ishangzu
//
//  Created by computer on 16/8/16.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLMoreSetupViewController.h"

@interface YLMoreSetupViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YLMoreSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.bounces=NO;
   
    self.tableView.sectionHeaderHeight=5;
    self.tableView.sectionFooterHeight=5;
  
}
- (IBAction)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource
//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==2) {
        return 2;
    }
    return 1;
}
//返回一个UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.section==0) {
       cell = [[[NSBundle mainBundle]loadNibNamed:@"YLMoreHeadCell" owner:nil options:nil]firstObject];
    }
   else if(indexPath.section==1)
    {
        cell.textLabel.text=@"屏蔽私信的人";
        cell.textLabel.font=[UIFont systemFontOfSize:15];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    else
    {
        if (indexPath.row==0) {
            cell.textLabel.text=@"意见反馈";
            cell.textLabel.font=[UIFont systemFontOfSize:15];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.textLabel.text=@"关于爱上租";
            cell.textLabel.font=[UIFont systemFontOfSize:15];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    return cell;
}
//多少组(默认为一组)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
#pragma mark - UITableViewDelegate
//监听选中某一行执行的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 60;
    }
    return 44;
}
@end
