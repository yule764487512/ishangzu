//
//  CALayer+YLBorderColor.m
//  ishangzu
//
//  Created by computer on 16/8/17.
//  Copyright © 2016年 ishangzu. All rights reserved.
//

#import "CALayer+YLBorderColor.h"

@implementation CALayer (YLBorderColor)
- (void)setBorderUIColor:(UIColor *)color
{
    self.borderColor=color.CGColor;
}
@end
