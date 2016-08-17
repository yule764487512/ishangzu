//
//  CircleButton.m
//  It13MatchBox
//
//  Created by lzm on 16/8/1.
//  Copyright © 2016年 lzm. All rights reserved.
//

#import "CircleButton.h"

@implementation CircleButton

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
