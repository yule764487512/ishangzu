//
//  YLUser.m
//  ishangzu
//
//  Created by computer on 16/8/16.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "YLUser.h"
static YLUser *manager=nil;
@implementation YLUser

+ (instancetype)shareManager
{
    if (manager == nil) {
        static  dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[super allocWithZone:NULL]init];
        });
    }
    return manager;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [YLUser shareManager];
}
- (instancetype)init
{
    if (self = [super init]) {
        NSUserDefaults * kdefault = [NSUserDefaults standardUserDefaults];
        _mobilePhone= [kdefault objectForKey:@"mobilePhone"];
        _nickname= [kdefault objectForKey:@"nickname"];
        _avatar= [kdefault objectForKey:@"avatar"];
        _occupation = [kdefault objectForKey:@"occupation"];
        _token = [kdefault objectForKey:@"token"];
        _uid = [[kdefault objectForKey:@"uid"]integerValue];
        _sex = [[kdefault objectForKey:@"sex"]integerValue];
    }
    return self;
}
- (void)setSex:(NSInteger)sex
{
    _sex = sex;
    NSUserDefaults * kdefault = [NSUserDefaults standardUserDefaults];
    [kdefault setInteger:sex forKey:@"sex"];
    [kdefault synchronize];
}
- (void)setOccupation:(NSString *)occupation
{
    _occupation=occupation;
    NSUserDefaults * kdefault = [NSUserDefaults standardUserDefaults];
    [kdefault setObject:occupation forKey:@"occupation"];
    [kdefault synchronize];
}
- (void)setAvatar:(NSString *)avatar
{
    _avatar=avatar;
    NSUserDefaults * kdefault = [NSUserDefaults standardUserDefaults];
    [kdefault setObject:avatar forKey:@"avatar"];
    [kdefault synchronize];
}
- (void)setMobilePhone:(NSString *)mobilePhone
{
    _mobilePhone=mobilePhone;
    NSUserDefaults * kdefault = [NSUserDefaults standardUserDefaults];
    [kdefault setObject:mobilePhone forKey:@"mobilePhone"];
    [kdefault synchronize];
}
- (void)setNickname:(NSString *)nickname
{
    _nickname=nickname;
    NSUserDefaults * kdefault = [NSUserDefaults standardUserDefaults];
    [kdefault setObject:nickname forKey:@"nickname"];
    [kdefault synchronize];
}
- (void)setUid:(NSInteger)uid
{
    _uid = uid;
    NSUserDefaults * kdefault = [NSUserDefaults standardUserDefaults];
    [kdefault setInteger:uid forKey:@"uid"];
    [kdefault synchronize];
}
- (void)setToken:(NSString *)token
{
    _token=token;
    NSUserDefaults * kdefault = [NSUserDefaults standardUserDefaults];
    [kdefault setObject:token forKey:@"token"];
    [kdefault synchronize];
}
/** 登出*/
- (void)logout
{
    self.uid=0;
}
@end



