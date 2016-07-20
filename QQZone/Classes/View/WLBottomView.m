//
//  WLBottomView.m
//  QQZone
//
//  Created by wanglong on 16/7/20.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLBottomView.h"

@implementation WLBottomView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    }
    return self;
}
- (void)rotateToLandscape:(BOOL)isLandscape
{
    self.height = isLandscape ? kDockItemHeight:3 * kDockItemHeight;
    self.width = self.superview.width;
    self.y = self.superview.height - self.height;
    self.x = 0;
    
}

@end
