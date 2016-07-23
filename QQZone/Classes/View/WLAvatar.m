//
//  WLAvatar.m
//  QQZone
//
//  Created by wanglong on 16/7/21.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLAvatar.h"

@implementation WLAvatar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        
        self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setImage:[UIImage imageNamed:@"Easy"] forState:UIControlStateNormal];
        [self setTitle:@"WangLong" forState:UIControlStateNormal];
    }
    return self;
}
- (void)rotateToLandscape:(BOOL)isLandscape
{
    self.width = isLandscape ?kAvatarBigWH :self.superview.width;
    self.height = isLandscape?self.width + kAvatarNameH:self.width ;
    self.x = (self.superview.width - self.width) * 0.5;
    self.y = kAvatarMargin;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.width == self.height) {
        return self.bounds;
    }else{
        CGFloat width= self.width;
        CGFloat height= width;
        CGFloat x= 0;
        CGFloat y= 0;
        return CGRectMake(x, y, width, height);
    }
}

- (CGRect) titleRectForContentRect:(CGRect)contentRect
{
    if (self.width == self.height) {
        return CGRectZero;
    }else{
        CGFloat width= self.width;
        CGFloat height= kAvatarNameH;
        CGFloat x= 0;
        CGFloat y= width;
        return CGRectMake(x, y, width, height);
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];

    if (self.width == self.height) {
        self.imageView.layer.cornerRadius = 0;
    }else{
//        设置圆形头像
        self.imageView.layer.cornerRadius = self.imageView.width * 0.5;
        self.imageView.clipsToBounds = YES;
    }

}
@end
