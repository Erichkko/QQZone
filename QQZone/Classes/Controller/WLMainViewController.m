//
//  WLMainViewController.m
//  QQZone
//
//  Created by wanglong on 16/7/20.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLMainViewController.h"
#import "WLDockView.h"
#import "UIView+AdjustFrame.h"
#import "UIImage+Fit.h"
@interface WLMainViewController ()
/** dockView */
@property(nonatomic,weak) WLDockView *dockView;

@end

@implementation WLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:55/255.0 green:55/255.0 blue:55/255.0 alpha:1.0];
    [self setupDockView];
}

#pragma mark - 初始化DockView
- (void)setupDockView{
    WLDockView *dockView = [[WLDockView alloc] init];
    self.dockView = dockView;
    
    dockView.height = self.view.height;
    //设置跟随父控件的变化而变化
    dockView.autoresizingMask = UIViewAutoresizingFlexibleHeight;

    BOOL isLandscape = self.view.width == kLandscapeWidth;
  

    [self.view addSubview:dockView];
    [self.dockView rotateToLandscape:isLandscape];
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
   
    CGFloat duration = [coordinator transitionDuration];
     NSLog(@"%f",duration);
    BOOL isLandscape = size.width == kLandscapeWidth;
    [UIView animateWithDuration:duration animations:^{
        [self.dockView rotateToLandscape:isLandscape];
    }];
    

}

@end
