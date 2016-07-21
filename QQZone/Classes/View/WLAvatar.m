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
        [self setTitle:@"Ez" forState:UIControlStateNormal];
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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    self.titleLabel.height = kAvatarNameH;
    self.titleLabel.width = self.width;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.x = 0;
//    设置圆形头像
//    self.imageView.layer.cornerRadius = self.imageView.width * 0.5;
//    self.imageView.clipsToBounds = YES;
}
@end
