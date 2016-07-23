//
//  WLMoodViewController.m
//  QQZone
//
//  Created by wanglong on 16/7/22.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLMoodViewController.h"

@interface WLMoodViewController ()

@end

@implementation WLMoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
}

- (void)setupNav
{
    self.title = @"发表心情";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closedVc)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(sendMood)];
}

- (void)closedVc
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)sendMood
{
    NSLog(@"sendMood...");
}
@end
