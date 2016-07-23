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
        [self addSubViewImage:@"tabbar_blog" typeName:WLBottomMenuItemBlog];
        [self addSubViewImage:@"tabbar_mood" typeName:WLBottomMenuItemMood];
        [self addSubViewImage:@"tabbar_photo" typeName:WLBottomMenuItemPhoto];
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

- (void)addSubViewImage:(NSString *)imageName typeName:(WLBottomMenuItemType)itemType
{
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = itemType;
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(cliclBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
  
}

- (void)cliclBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(bottomView:type:)]) {
        [self.delegate bottomView:self type:(int)btn.tag];
    }
}
@end
