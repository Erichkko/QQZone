//
//  WLLoginViewController.m
//  QQZone
//
//  Created by wanglong on 16/7/19.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLLoginViewController.h"
#import "WLMainViewController.h"

@interface WLLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadIndicator;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *remeberBtn;
/**
 *  点击登录按钮
 */
- (IBAction)autoLogin:(UIButton *)sender;
- (IBAction)remPassword:(UIButton *)sender;
- (IBAction)loginClick;
@end

@implementation WLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBasic];
}

-(void)setupBasic
{
    self.accountField.delegate = self;
    self.passwordField.delegate = self;
    
}

- (IBAction)autoLogin:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    if (sender.isSelected) {
        self.remeberBtn.selected = true;
    }
}

- (IBAction)remPassword:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    if (sender.isSelected == NO) {
        self.autoLoginBtn.selected = NO;
    }
}

- (IBAction)loginClick {
    
    NSString *account = self.accountField.text;
    NSString *password = self.passwordField.text;
    //退出键盘
    [self.view endEditing:YES];
    //判断帐号和密码 是否为空
    if (account.length == 0||password.length == 0) {
        [self showErrorLogin:@"帐号或密码不可以为空..."];
        return;
    }
    //细节操作
    [self.loadIndicator startAnimating];
    self.view.userInteractionEnabled = NO;
    
    //模拟网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //细节操作
        [self.loadIndicator stopAnimating];
         self.view.userInteractionEnabled = YES;
        
        
        if ([account isEqualToString:@"123"]&&[password isEqualToString:@"123"]) {
            WLMainViewController *mainVc = [[WLMainViewController alloc] init];
            [self presentViewController:mainVc animated:YES completion:nil];
            
//            self.view.window.rootViewController
//            [UIApplication sharedApplication].keyWindow.rootViewController;
        }else{
            [self showErrorLogin:@"帐号或密码不正确..."];
        }
        
        
    });
}

- (void)showErrorLogin:(NSString *)errorMsg
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录失败!" message:errorMsg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];

    [self presentViewController:alert animated:YES completion:nil];
    [self showErrorAnim];
}
- (void)showErrorAnim
{
    CALayer *containerLayer = self.containerView.layer;
    //序列帧动画属于核心动画 并不会改变真是的frame
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    shakeAnim.values = @[@(-10) ,@0,@10,@(0),@(-10)];
    shakeAnim.repeatCount = 5;
    shakeAnim.duration = 0.25;
    
    
    [containerLayer addAnimation:shakeAnim forKey:nil];
    
}

#pragma mark - textFieldShouldReturn

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.accountField) {
        [self.passwordField becomeFirstResponder ];
    }else{
        [self loginClick];
    }
    return YES;
}
@end
