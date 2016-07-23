//
//  WLFeedViewController.m
//  QQZone
//
//  Created by wanglong on 16/7/23.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLFeedViewController.h"

@interface WLFeedViewController ()

@end

@implementation WLFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
}
-(void)setupNav
{
    NSArray *items = @[@"全部",@"特别关心",@"好友动态",@"认证空间"];
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:items];

    self.navigationItem.titleView = segControl;
    segControl.selectedSegmentIndex = 0;
    segControl.tintColor = [UIColor lightGrayColor];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [segControl setTitleTextAttributes:attrs forState:UIControlStateNormal];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [segControl setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    [segControl addTarget:self action:@selector(clickSegItem:) forControlEvents:UIControlEventValueChanged];
    [self clickSegItem:segControl];
}

- (void)clickSegItem:(UISegmentedControl *)seg
{
    NSLog(@"selectedSegmentIndex == %zd",seg.selectedSegmentIndex);
}
@end
