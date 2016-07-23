//
//  WLDockView.m
//  QQZone
//
//  Created by wanglong on 16/7/20.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLDockView.h"
#import "WLBottomView.h"
#import "WLTabbar.h"
#import "WLAvatar.h"

@interface WLDockView()

@end
@implementation WLDockView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        [self setupBottomView];
        [self setupTabbar];
        [self setupAvatar];
    }
    return self;
}


- (void)setupAvatar
{
    WLAvatar *avatar = [[WLAvatar alloc] init];
    _avatar = avatar;
    [self addSubview:avatar];
}
- (void)setupTabbar
{
    WLTabbar *tabbar = [[WLTabbar alloc] init];
    _tabbar = tabbar;
    [self addSubview:tabbar];
    
}

- (void)setupBottomView
{
    WLBottomView *bottomView = [[WLBottomView alloc] init];
    _bottomView = bottomView;
    [self addSubview:bottomView];
}

- (void)rotateToLandscape:(BOOL)isLandscape
{
    //设置自身View的宽度
    self.width = isLandscape?kDockLandscapeWidth:kDockPortraitdWidth;
    
    //设置底部menu
    [self.bottomView rotateToLandscape:isLandscape];
    
    //设置tabbar
    [self.tabbar rotateToLandscape:isLandscape];
    
    //设置头像
    [self.avatar rotateToLandscape:isLandscape];
}
@end
