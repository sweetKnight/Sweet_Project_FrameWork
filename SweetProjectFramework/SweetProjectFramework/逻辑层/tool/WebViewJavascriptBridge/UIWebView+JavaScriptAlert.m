//
//  UIWebView+JavaScriptAlert.m
//  GlobalCity
//
//  Created by 张长乐 on 15/4/28.
//  Copyright (c) 2015年 jamesdurant. All rights reserved.
//

#import "UIWebView+JavaScriptAlert.h"

@implementation UIWebView (JavaScriptAlert)

//static BOOL diagStat = NO;
//
//-(void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(id)frame{
//    UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
//    [dialogue show];;
//}
//
//-(BOOL)webView:(UIWebView *)sender runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(id)frame{
//    UIAlertView* dialogue = [[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:NSLocalizedString(@"Okay", @"Okay") otherButtonTitles:NSLocalizedString(@"Cancel", @"Cancel"), nil];
//    [dialogue show];
//    while (dialogue.hidden==NO && dialogue.superview!=nil) {
//        [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01f]];
//    }
//    
//    return diagStat;
//}
//
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex==0) {
//        diagStat=YES;
//    }else if(buttonIndex==1){
//        diagStat=NO;
//    }
//}

@end
