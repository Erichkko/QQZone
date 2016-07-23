//
//  WLTabbar.m
//  QQZone
//
//  Created by wanglong on 16/7/21.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLTabbar.h"

#import "WLBar.h"

@interface WLTabbar()

/** currentBtn */
@property(nonatomic,weak)WLBar *currentBtn;

@end
@implementation WLTabbar


- (instancetype)initWithFrame:(CGRect)frame
{
    /**
     WLTabbarTypeFeed,
     WLTabbarTypePassiveFeed,
     WLTabbarTypePicWall,
     WLTabbarTypeEPhoto,
     WLTabbarTypeFriend,
     WLTabbarTypeMore
     */
    if (self = [super initWithFrame:frame]) {
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self addTabbarWithImage:@"tab_bar_feed_icon" andTitle:@"全部动态" andType:WLTabbarTypeFeed];
        [self addTabbarWithImage:@"tab_bar_passive_feed_icon" andTitle:@"与我相关" andType:WLTabbarTypePassiveFeed];
        [self addTabbarWithImage:@"tab_bar_pic_wall_icon" andTitle:@"照片墙" andType:WLTabbarTypePicWall];
        [self addTabbarWithImage:@"tab_bar_friend_icon-1" andTitle:@"电子相册" andType:WLTabbarTypeEPhoto];
        [self addTabbarWithImage:@"tab_bar_friend_icon" andTitle:@"好友" andType:WLTabbarTypeFriend];
        [self addTabbarWithImage:@"tab_bar_e_more_icon" andTitle:@"更多"andType:WLTabbarTypeMore];
        
    }
    return self;
}

/**
 *  添加子空间
 */

-(void)addTabbarWithImage:(NSString *)imageName andTitle:(NSString *)title andType:(WLTabbarType)type
{
    WLBar *button = [WLBar buttonWithType:UIButtonTypeCustom];
    button.tag = type;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(clickBar:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

/**
 *  添加点击事件
 */
- (void)clickBar:(WLBar *)btn
{
    if ([self.delegate respondsToSelector:@selector(tabbar:clikcType:lastType:)]) {
        [self.delegate tabbar:self clikcType:(int)btn.tag lastType:(int)self.currentBtn.tag];
    }
    
    [self.currentBtn setSelected:NO];
    [btn setSelected:YES];
    self.currentBtn = btn;
    
    
}
/**
 *  设置子控件的Frame
 */
- (void)setChildFrame:(BOOL)isLandscape
{
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *bar = (UIButton *)self.subviews[i];
       
            bar.width = self.superview.width;
            bar.height = kDockItemHeight;
            bar.x = 0;
            bar.y = i * kDockItemHeight;
        
    }
    
}
/**
 *  当发生旋转时调用此方法
 */
- (void)rotateToLandscape:(BOOL)isLandscape
{
    self.width = self.superview.width;
    self.height = self.subviews.count * kDockItemHeight;
    self.y = isLandscape?self.superview.height - self.height - kDockItemHeight:self.superview.height - self.height - 3 * kDockItemHeight;
    self.x = 0;
    [self setChildFrame:isLandscape];
}

- (void)setBarSelected:(BOOL)select
{
    self.currentBtn.selected = select;
}
@end
