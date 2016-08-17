//
//  UIView+FrameUtil.h
//  IT13FrameUtil
//
//  Created by lzm on 16/6/21.
//  Copyright © 2016年 lzm. All rights reserved.
//

#import <UIKit/UIKit.h>


#define appW     [UIScreen mainScreen].bounds.size.width
#define appH     [UIScreen mainScreen].bounds.size.height

@interface UIView (FrameUtil)
 
// 分类里面不能生成成员属性
// 会自动生成get，set方法和成员属性
// @property如果在分类里面只会生成get,set方法的声明，并不会生成成员属性。
@property (nonatomic, readwrite, assign) CGFloat height;
@property (nonatomic, readwrite, assign) CGFloat width;
@property (nonatomic, readwrite, assign) CGFloat left;
@property (nonatomic, readwrite, assign) CGFloat top;
@property (nonatomic, readwrite, assign) CGFloat right;
@property (nonatomic, readwrite, assign) CGFloat bottom;
@property (nonatomic, readwrite, assign) CGFloat centerX;
@property (nonatomic, readwrite, assign) CGFloat centerY;
@property (nonatomic, readwrite, assign) CGPoint origin;
@property (nonatomic, readwrite, assign) CGSize  size;


@end
