//
//  BasicWebViewController.h
//  tablebg
//
//  Created by 于洋 on 15/12/8.
//  Copyright © 2015年 冯剑锋. All rights reserved.
//

#import "BaseViewController.h"
#import "WebViewJavascriptBridge.h"

@interface BasicWebViewController : BaseViewController

@property (nonatomic,strong)UIWebView *webView;
/**
 *  用于交互
 */
@property (strong, nonatomic) WebViewJavascriptBridge *javascriptBridge;

@property (nonatomic,strong) NSString *navigationTitle;

@property (nonatomic,strong) NSString *webUrl;
/*!
 *  交互结果处理
 *
 *  @param data h5返回的数据
 */
-(void)resultsProcessing:(NSDictionary *)data;
-(void)WebViewJavascrip;
/*!
 *  出现分享界面
 */
-(void)showShareView;
@end
