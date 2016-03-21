//
//  BaseViewController.h
//  TangRen
//
//  Created by CNBJCHENRJM021 on 16/2/2.
//  Copyright © 2016年 KeJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SweetConfig.h"
#import "UIViewController+DismissKeyboard.h"
#import "UIView+Common.h"

@interface BaseViewController : UIViewController

- (void)createleftBtnWithStr:(NSString *)str;
- (void)createRightBtnWithStr:(NSString *)str;
- (void)rightAction;
- (void)backTo;
- (void)hiddenLeftBtn;
- (void)hiddenRightBtn:(BOOL)state;

- (void) showMessage:(NSString*)message;

/**
 *  显示错误信息
 *
 *  @param error 返回的错误信息
 */
- (void) showError:(NSError*)error;
/**
 *  显示错误的code码和信息
 *
 *  @param code    返回的code码
 *  @param message 返回的信息
 */
- (void) failureWithCode:(NSString*)code message:(NSString*)message;
/**
 *  显示大菊花
 */
-(void)showprogressHUD;
/**
 *  隐藏大菊花
 */
-(void)hiddenProgressHUD;
/**
 *  操作成功
 *
 *  @param successfulMessage
 */
-(void) showsuccessful:(NSString * ) successfulMessage;

-(void)createTitle:(NSString *)title titleColor:(UIColor *)color;

@end
