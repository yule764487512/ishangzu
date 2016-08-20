//
//  YLTalks.h
//  ishangzu
//
//  Created by computer on 16/8/19.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLTalks : NSObject

@property (nonatomic, copy) NSString *isTalksCircle;

@property (nonatomic, copy) NSString *isDeleted;
/**话题名称 */
@property (nonatomic, copy) NSString *talksTagsName;

@property (nonatomic, copy) NSString *talkType;
/** 大图*/
@property (nonatomic, copy) NSString *mainImg;
/** 昵称*/
@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger isThumbup;
/** 性别*/
@property (nonatomic, assign) NSInteger sex;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, assign) NSInteger deleted;

@property (nonatomic, copy) NSString *mobilePhone;

@property (nonatomic, copy) NSString *thumbupId;
/** 创建时间*/
@property (nonatomic, assign) long long createdAt;
/**参数返回的用户id*/
@property (nonatomic, copy) NSString *backuid;

@property (nonatomic, copy) NSString *talksTagsIds;

@property (nonatomic, assign) long long updatedAt;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger thumbupCount;

@property (nonatomic, copy) NSString *distance;
/** 评论数*/
@property (nonatomic, assign) NSInteger commentCount;
/** 头像*/
@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *thumbupType;

@property (nonatomic, copy) NSString *customerRelation;

/** 话题id*/
@property (nonatomic, assign) NSInteger talksTagsId;
/** 内容*/
@property (nonatomic, copy) NSString *content;

@end
