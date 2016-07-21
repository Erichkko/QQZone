//
//  WLTabbar.m
//  QQZone
//
//  Created by wanglong on 16/7/21.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLTabbar.h"

@implementation WLTabbar


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    }
    return self;
}
- (void)rotateToLandscape:(BOOL)isLandscape
{
    self.width = self.superview.width;
    self.height = 5 * kDockItemHeight;
    self.y = isLandscape?self.superview.height - self.height - kDockItemHeight:self.superview.height - self.height - 3 * kDockItemHeight;
    self.x = 0;
}

@end
