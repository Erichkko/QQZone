//
//  WLDockView.h
//  QQZone
//
//  Created by wanglong on 16/7/20.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLBottomView;
@class WLTabbar;
@class WLAvatar;
@interface WLDockView : UIView

/** bottomView */
@property(nonatomic,weak,readonly) WLBottomView *bottomView;
/** tabbar */
@property(nonatomic,weak,readonly) WLTabbar *tabbar;
/** avatar */
@property(nonatomic,weak,readonly) WLAvatar *avatar;


- (void)rotateToLandscape:(BOOL)isLandscape;
@end
