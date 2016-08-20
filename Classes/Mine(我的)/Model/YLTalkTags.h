//
//  YLTalkTags.h
//  ishangzu
//
//  Created by computer on 16/8/19.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLTalkTags : NSObject
//话题ID
@property (nonatomic, assign) NSInteger talksTagsId;

/** 图片*/
@property (nonatomic, copy) NSString *logo;
/** 标题*/
@property (nonatomic, copy) NSString *tag;
/** 描述*/
@property (nonatomic, copy) NSString *remark;
@end



