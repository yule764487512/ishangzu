//
//  YLUser.h
//  ishangzu
//
//  Created by computer on 16/8/16.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KuserManager [YLUser shareManager]
@interface YLUser : NSObject
/** 登录后的标识*/
@property (nonatomic,copy)NSString *token;
/** 用户ID*/
@property (nonatomic,assign)NSInteger uid;
/** 性别*/
@property (nonatomic, assign) NSInteger sex;
/** 职业*/
@property (nonatomic, copy) NSString *occupation;

/** 头像*/
@property (nonatomic, copy) NSString *avatar;

/** 手机号*/
@property (nonatomic, copy) NSString *mobilePhone;

/** 昵称*/
@property (nonatomic, copy) NSString *nickname;
+ (instancetype)shareManager;
/** 登出*/
- (void)logout;
@end

