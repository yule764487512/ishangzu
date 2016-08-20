
//
//  BannerModel.h
//  ishangzu
//
//  Created by computer on 16/8/19.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject


/** 跳转后的*/
@property (nonatomic, copy) NSString *url;
/** 当前图*/
@property (nonatomic, copy) NSString *img;
/** 跳转后标题*/
@property (nonatomic, copy) NSString *title;


@end
