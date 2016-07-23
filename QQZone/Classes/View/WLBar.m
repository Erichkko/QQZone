//
//  WLBar.m
//  QQZone
//
//  Created by wanglong on 16/7/22.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLBar.h"

const CGFloat kRatio = 0.4;

@implementation WLBar


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}
- (void)setHighlighted:(BOOL)highlighted
{
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.width == self.height) {
        return contentRect;
    }else{
        
        CGFloat width = self.width * kRatio;
        CGFloat height = self.height;
        CGFloat x = 0;
        CGFloat y = 0;
        return CGRectMake(x, y, width,height);
        
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.width == self.height) {
        return CGRectZero;
    }else{
        CGFloat width = self.width * (1-kRatio);
        CGFloat height = self.height;
        CGFloat x = self.width * kRatio;
        CGFloat y = 0;
        
        return CGRectMake(x, y, width,height);
    }
}
@end
