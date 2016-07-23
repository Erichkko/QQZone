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
#import "WLBottomView.h"

#import "WLMoodViewController.h"
@interface WLMainViewController ()<WLBottomViewDelegate>
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
    dockView.bottomView.delegate = self;
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
#pragma mark - WLBottomViewDelegate 底部按钮的点击事件

- (void)bottomView:(WLBottomView *)bottom type:(WLBottomMenuItemType)itemType
{
    switch (itemType) {
        case WLBottomMenuItemBlog:
            NSLog(@"WLBottomMenuItemBlog");
            break;
        case WLBottomMenuItemMood:
            /**
             *  case里边创建对象必须加括号 因为}结尾是对象的生命周期结束
             */
            {
                
                //创建目标控制器
                WLMoodViewController *moodVc = [[WLMoodViewController alloc] init];
                moodVc.view.backgroundColor = [UIColor redColor];
                
                
                //创建 导航控制器
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:moodVc];
                //设置modal的Style
                nav.modalPresentationStyle = UIModalPresentationFormSheet;
//                nav.modalTransitionStyle = UIModalTransitionStylePartialCurl;

                
                [self presentViewController:nav animated:YES completion:nil];
            }
            break;
        case WLBottomMenuItemPhoto:
            NSLog(@"WLBottomMenuItemPhoto");
            break;
        default:
            break;
    }
}
@end
