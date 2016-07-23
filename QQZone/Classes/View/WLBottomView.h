//
//  WLBottomView.h
//  QQZone
//
//  Created by wanglong on 16/7/20.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    WLBottomMenuItemBlog,
    WLBottomMenuItemMood,
    WLBottomMenuItemPhoto
}WLBottomMenuItemType;

@class WLBottomView;
@protocol WLBottomViewDelegate <NSObject>

@optional
-(void)bottomView:(WLBottomView *)bottom type:(WLBottomMenuItemType)itemType;
@end

@interface WLBottomView : UIView
- (void)rotateToLandscape:(BOOL)isLandscape;

/** delegate */
@property(nonatomic,weak)id <WLBottomViewDelegate> delegate;
@end
