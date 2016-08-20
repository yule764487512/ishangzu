//
//  YLEditViewController.m
//  ishangzu
//
//  Created by computer on 16/8/17.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLEditViewController.h"
#import "YLUser.h"
@interface YLEditViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray * titles;
@property (nonatomic,strong)NSArray * infos;


@end

@implementation YLEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"个人信息";
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.sectionFooterHeight=5;
    self.tableView.sectionHeaderHeight=5;

    
}


- (NSArray *)titles
{
    if (!_titles) {
        _titles=@[@"昵称",@"性别",@"职业",@"绑定手机"];
    }
  
    return _titles;
}
- (NSArray *)infos
{
    if (!_infos) {
        NSString *sexStr=KuserManager.sex?@"男":@"女";
        _infos=@[KuserManager.nickname,sexStr,KuserManager.occupation,KuserManager.mobilePhone];
    }
    return _infos;
}

/** 注销登录*/
- (IBAction)logoutAction {
    
}
#pragma mark - UITableViewDataSource
//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        default:
            return 4;
            break;
    }
}
//返回一个UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *ID=@"YLCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        UILabel *titleLable=[[UILabel alloc]initWithFrame:CGRectMake(16, 11, 100, 21)];
        titleLable.font=[UIFont systemFontOfSize:15];
        titleLable.textColor=[UIColor lightGrayColor];
        [cell.contentView addSubview:titleLable];
      
        if (indexPath.section==0) {
            UIImageView *headView=[[UIImageView alloc]initWithFrame:CGRectMake(appW-76, 4, 35, 35)];
            [headView sd_setImageWithURL:[NSURL URLWithString:KuserManager.avatar] placeholderImage:[UIImage imageNamed:@"Z-1"]];
            [cell.contentView addSubview:headView];
            titleLable.text=@"头像";
        }
        else
        {
            titleLable.text=self.titles[indexPath.row];
            UILabel *infoLable=[[UILabel alloc]initWithFrame:CGRectMake(appW-190, 11, 150, 21)];
            infoLable.textAlignment=NSTextAlignmentRight;
            infoLable.textColor=[UIColor blackColor];
            infoLable.font=[UIFont systemFontOfSize:15];
            [cell.contentView addSubview:infoLable];
            infoLable.text=self.infos[indexPath.row];
        }
     
    }
    
    return cell;
   
}
//多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}



@end
