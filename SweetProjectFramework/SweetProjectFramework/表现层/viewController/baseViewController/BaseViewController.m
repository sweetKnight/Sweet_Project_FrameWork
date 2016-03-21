//
//  BaseViewController.m
//  TangRen
//
//  Created by CNBJCHENRJM021 on 16/2/2.
//  Copyright © 2016年 KeJiang. All rights reserved.
//

#import "BaseViewController.h"
#import <MBProgressHUD.h>

@interface BaseViewController ()
{
    UIButton *backBtn;
    
    UIButton *rightBtn;
}

@property (nonatomic, strong) MBProgressHUD *progressHUD;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = getColor(@"E1DEE5");
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupForDismissKeyboard];
    
    UIBarButtonItem * button =[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = button;
    self.navigationController.navigationBar.barTintColor = getColor(@"2F2F2F");
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19.0f],NSForegroundColorAttributeName: [UIColor whiteColor]}];
//    [self createleftBtnWithStr:@"back"];
    
    _progressHUD = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:_progressHUD];
    
}

-(void)showprogressHUD{
    [_progressHUD show:YES];
}

-(void)hiddenProgressHUD{
    [_progressHUD hide:YES];
}

- (void)createTitle:(NSString *)title titleColor:(UIColor *)color
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:18.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.textColor = color;
    
    self.navigationItem.titleView = titleLabel;
    
}
- (void)createleftBtnWithStr:(NSString *)str
{
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 18, 18);
    [backBtn setImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backTo) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)backTo
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)hiddenLeftBtn
{
    backBtn.hidden = YES;
}


- (void)createRightBtnWithStr:(NSString *)str
{

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:str] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    [rightItem setTintColor:getColor(grayColor)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)rightAction
{
    
}

- (void)hiddenRightBtn:(BOOL)state
{
    rightBtn.hidden = state;
}

- (void) showMessage:(NSString*)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
    });
}

-(void) showsuccessful:(NSString * ) successfulMessage{
    [self showMessage:successfulMessage];
}

- (void) showError:(NSError*)error{
    //        [self showMessage:error.description];
    [self showMessage:@"哎呀,网不给力呀"];
}

- (void) failureWithCode:(NSString*)code message:(NSString*)message{
    [self showMessage:message];
}

@end
