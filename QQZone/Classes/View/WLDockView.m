//
//  WLDockView.m
//  QQZone
//
//  Created by wanglong on 16/7/20.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLDockView.h"
#import "WLBottomView.h"

@interface WLDockView()
/** bottomView */
@property(nonatomic,weak) WLBottomView *bottomView;

@end
@implementation WLDockView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        [self setupBottomView];
    }
    return self;
}
- (void)setupBottomView
{
    WLBottomView *bottomView = [[WLBottomView alloc] init];
    self.bottomView = bottomView;
    bottomView.backgroundColor = [UIColor purpleColor];
    [self addSubview:bottomView];
}

- (void)rotateToLandscape:(BOOL)isLandscape
{
    
    CGFloat dockWidth = isLandscape?kDockLandscapeWidth:kDockPortraitdWidth;
    self.width= dockWidth;
    [self.bottomView rotateToLandscape:isLandscape];
}
@end
