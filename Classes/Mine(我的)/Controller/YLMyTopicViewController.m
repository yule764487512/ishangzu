//
//  YLMyTopicViewController.m
//  ishangzu
//
//  Created by computer on 16/8/18.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLMyTopicViewController.h"

#import "YLTalkTags.h"
@interface YLMyTopicViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)UITableView * tableView;
@property (nonatomic,weak)UIScrollView * scrollView;
@property (nonatomic,strong)NSArray * talksTags;
@property (nonatomic,strong)NSArray * talks;
@end

@implementation YLMyTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadData];
    [self initUI];
}
- (void)loadData
{
    NSDictionary *dict=@{@"backuid":KUid};
    _talksTags=[NSArray array];
    [HYBNetworking postWithUrl:@"http://appnew.ishangzu.com/api/common/0702" refreshCache:YES params:dict success:^(id response) {
        NSLog(@"%@",response);
        _talksTags=[YLTalkTags mj_objectArrayWithKeyValuesArray:response[@"obj"][@"talksTags"]];
      
        CGFloat magin=15;
        CGFloat btnH=60;
        CGFloat btnW=(appW-3*magin)/2.5;
        CGFloat btnY=15;
        NSInteger count=self.talksTags.count;
        for (int i=0; i<count; i++) {
            CGFloat btnX=magin+i*(magin+btnW);
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
            YLTalkTags *talkTags =self.talksTags[i];
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:talkTags.logo] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"28-6"]];
            [self.scrollView addSubview: btn];
            
        }
        self.scrollView.contentSize=CGSizeMake(count*btnW+(count+1)*magin, 0);
    } fail:^(NSError *error) {
        
    }];

}




- (void)initUI
{
    self.title=@"我的话题";
    self.view.backgroundColor=[UIColor colorWithRed:0.922 green:0.922 blue:0.945 alpha:1.000];
    UILabel *mytopicLable=[[UILabel alloc]initWithFrame:CGRectMake(8, 72, 90, 18)];
    mytopicLable.textColor=[UIColor lightGrayColor];
    mytopicLable.text=@"我的话题标签";
    mytopicLable.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:mytopicLable];
    
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, mytopicLable.bottom+8, appW, 90)];
    scrollView.backgroundColor=[UIColor whiteColor];
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.bounces=NO;
    self.scrollView=scrollView;
    [self.view addSubview:scrollView];
    
    
    UILabel *alltopicLable=[[UILabel alloc]initWithFrame:CGRectMake(8, scrollView.bottom+8, 90, 18)];
    alltopicLable.textColor=[UIColor lightGrayColor];
    alltopicLable.text=@"所有话题";
    alltopicLable.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:alltopicLable];
  
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, alltopicLable.bottom+8, appW, appH-alltopicLable.bottom-8) style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    self.tableView=tableView;
    [self.view addSubview:tableView];
    
    
}
#pragma mark - UITableViewDataSource
//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
//返回一个UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}



@end
