//
//  CircleView.m
//  ishangzu
//
//  Created by computer on 16/8/16.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (void)setCircle:(BOOL)circle
{
    _circle = circle;
    if (_circle) {
        self.layer.cornerRadius = self.height * 0.5;
        self.layer.masksToBounds = YES;
        [UIColor colorWithRed:0.208 green:0.259 blue:0.267 alpha:1.000];
    }
}

@end
