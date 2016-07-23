//
//  WLTabbar.h
//  QQZone
//
//  Created by wanglong on 16/7/21.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    WLTabbarTypeFeed,
    WLTabbarTypePassiveFeed,
    WLTabbarTypePicWall,
    WLTabbarTypeEPhoto,
    WLTabbarTypeFriend,
    WLTabbarTypeMore,
    WLTabbarTypeAvatar
}WLTabbarType;
@class WLTabbar;

@protocol WLTabbarDelegate <NSObject>

@optional
- (void)tabbar:(WLTabbar *)tababr clikcType:(WLTabbarType)type lastType:(WLTabbarType)lastType;

@end
@interface WLTabbar : UIView

/** delegate */
@property(nonatomic,weak)id <WLTabbarDelegate> delegate;
- (void)rotateToLandscape:(BOOL)isLandscape;
- (void)setBarSelected:(BOOL)select;
@end
