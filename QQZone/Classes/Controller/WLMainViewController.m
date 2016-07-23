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
#import "WLTabbar.h"
#import "WLAvatar.h"

#import "WLMoodViewController.h"

#import "WLFeedViewController.h"
@interface WLMainViewController ()<WLBottomViewDelegate,WLTabbarDelegate>
/** dockView */
@property(nonatomic,weak) WLDockView *dockView;
/** contentView */
@property(nonatomic,weak)UIView *contentView;
/**lastType*/
@property(nonatomic,assign)WLTabbarType lastType;
@end

@implementation WLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:55/255.0 green:55/255.0 blue:55/255.0 alpha:1.0];
    [self setupDockView];
    [self addChildVcs];
    [self setupContentView];
    [self clickAvatar];
}
- (void)setupContentView
{
    UIView *contentView = [[UIView alloc] init];
    self.contentView = contentView;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    contentView.width = kContentViewWidth;
    contentView.height = self.view.height - kStatusheight;
    contentView.y = kStatusheight;
    contentView.x = self.dockView.width;
    [self.view addSubview:contentView];
    
}

#pragma mark - 添加子控制器

- (void)addChildVcs
{
    WLFeedViewController *vc1 = [[WLFeedViewController alloc] init];
   
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    [self addChildViewController:nav1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor  = [UIColor yellowColor];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    [self addChildViewController:nav2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor  = [UIColor purpleColor];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    [self addChildViewController:nav3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor  = [UIColor blueColor];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    [self addChildViewController:nav4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor  = [UIColor grayColor];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:vc5];
    [self addChildViewController:nav5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.view.backgroundColor  = [UIColor yellowColor];
    UINavigationController *nav6 = [[UINavigationController alloc] initWithRootViewController:vc6];
    [self addChildViewController:nav6];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.view.backgroundColor  = [UIColor whiteColor];
    UINavigationController *nav7 = [[UINavigationController alloc] initWithRootViewController:vc7];
    vc7.title = @"个人中心";
    [self addChildViewController:nav7];
    
}

#pragma mark - 初始化DockView
- (void)setupDockView{
    WLDockView *dockView = [[WLDockView alloc] init];
    dockView.bottomView.delegate = self;
    dockView.tabbar.delegate = self;
    [dockView.avatar addTarget:self action:@selector(clickAvatar) forControlEvents:UIControlEventTouchUpInside];
    
    self.dockView = dockView;
    
    dockView.height = self.view.height;
    //设置跟随父控件的变化而变化
    dockView.autoresizingMask = UIViewAutoresizingFlexibleHeight;

    BOOL isLandscape = self.view.width == kLandscapeWidth;
  

    [self.view addSubview:dockView];
    [self.dockView rotateToLandscape:isLandscape];
    
}
- (void)clickAvatar
{
    [self tabbar:nil clikcType:WLTabbarTypeAvatar lastType:self.lastType];
    [self.dockView.tabbar setBarSelected:NO];
}
#pragma mark - 当屏幕发生旋转时 调用此方法
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
   
    CGFloat duration = [coordinator transitionDuration];
     NSLog(@"%f",duration);
    BOOL isLandscape = size.width == kLandscapeWidth;
    [UIView animateWithDuration:duration animations:^{
        [self.dockView rotateToLandscape:isLandscape];
        self.contentView.x = self.dockView.width;
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

#pragma mark - WLTabbarDelegate tabbar的点击事件处理

- (void)tabbar:(WLTabbar *)tababr clikcType:(WLTabbarType)type lastType:(WLTabbarType)lastType
{
    NSLog(@"fromVc ==%zd ,toVc == %zd",lastType,type);
    self.lastType = type;
    
    UIViewController *oldVc = self.childViewControllers[lastType];
    
    [oldVc.view removeFromSuperview];
    
    UIViewController *clikcVc = self.childViewControllers[type];
    clikcVc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:clikcVc.view];
    

}
@end
