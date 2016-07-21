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
        [self addSubViews];
    }
    return self;
}
- (void)rotateToLandscape:(BOOL)isLandscape
{
    self.height = isLandscape ? kDockItemHeight:self.subviews.count * kDockItemHeight;
    self.width = self.superview.width;
    self.y = self.superview.height - self.height;
    self.x = 0;
    //设置子控件的位置
    
    [self setupMenuItemFrame:isLandscape];
}

- (void)setupMenuItemFrame:(BOOL)isLandscape
{
    CGFloat menuWH= self.width / kBottomMenuCount;

    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *itemBtn = self.subviews[i];
        if (isLandscape) {
            itemBtn.width = menuWH;
            itemBtn.height = kDockItemHeight;
            itemBtn.x = menuWH * i;
            itemBtn.y = 0;
        }else{
            itemBtn.width = kDockItemHeight;
            itemBtn.height = kDockItemHeight;
            itemBtn.y = kDockItemHeight * i;
            itemBtn.x = 0;
        }
        
    }
}

- (void)addSubViews
{
    NSArray *menus = @[@"tabbar_blog",@"tabbar_mood",@"tabbar_photo"];
    for (int i = 0; i < kBottomMenuCount; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:menus[i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
        [self addSubview:btn];
    }
}
@end
