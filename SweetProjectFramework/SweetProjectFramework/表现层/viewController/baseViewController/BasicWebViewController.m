//
//  BasicWebViewController.m
//  tablebg
//
//  Created by 于洋 on 15/12/8.
//  Copyright © 2015年 冯剑锋. All rights reserved.
//

#import "BasicWebViewController.h"

NS_ENUM(NSInteger, ShareButtonTag){
    ShareButtonTagWeichatFriend = 500,
    ShareButtonTagWeichat,
    ShareButtonTagSina
};

@interface BasicWebViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIView * shareBgView;
@property (nonatomic, strong) UIView * bottonView;

@end

@implementation BasicWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT-64)];
    self.webView.delegate = self;
    self.webView.backgroundColor = getColor(@"E1DEE5");
    [self.view addSubview:self.webView];
    
    self.title = self.navigationTitle;

    self.webView.dataDetectorTypes = UIDataDetectorTypeNone;
    [self loadWebPage];
    [self WebViewJavascrip];
}

#pragma mark - 分享文件
-(UIView *)shareBgView{
    if (_shareBgView == nil) {
        _shareBgView = [[UIView alloc]initWithFrame:DEF_SCREEN_FRAME];
        _shareBgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        _shareBgView.hidden = YES;
        UIButton * cancelButton = [[UIButton alloc]initWithFrame:DEF_SCREEN_FRAME];
        cancelButton.backgroundColor = [UIColor clearColor];
        [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_shareBgView addSubview:cancelButton];
        _bottonView = [[UIView alloc]initWithFrame:CGRectMake(0, DEF_SCREEN_HEIGHT, DEF_SCREEN_WIDTH, 150)];
        _bottonView.backgroundColor = [UIColor whiteColor];
        [_shareBgView addSubview:_bottonView];
        
        CGFloat buttonWithd = 45;
        CGFloat buttonClearance = (DEF_SCREEN_WIDTH - 200)/2;
        CGFloat labelWithd = DEF_SCREEN_WIDTH/3;
        NSArray * buttonBgArray = @[[UIImage imageNamed:@"share_weichatfirend_button_bg"],
                                    [UIImage imageNamed:@"share_weichat_button_bg"],
                                    [UIImage imageNamed:@"share_sina_button_bg"]];
        NSArray * buttonName = @[@"微信朋友圈",@"微信好友",@"新浪微博"];
        for (int i = 0; i < buttonBgArray.count; i++) {
            UIButton * button = [[UIButton alloc]init];
            button.frame = CGRectMake(32.5+ i*(buttonWithd + buttonClearance), 15, buttonWithd, buttonWithd);
            button.tag = 500 + i;
            [button setBackgroundImage:buttonBgArray[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(shareButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
            [_bottonView addSubview:button];
            UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelWithd*i, button.bottom+ 10, labelWithd, 15)];
            nameLabel.textColor = getColor(@"333333");
            nameLabel.text = buttonName[i];
            nameLabel.textAlignment = NSTextAlignmentCenter;
            [_bottonView addSubview:nameLabel];
        }
        
        UIButton * cancelButtonBottom = [[UIButton alloc]initWithFrame:CGRectMake(15, _bottonView.height - 55, DEF_SCREEN_WIDTH - 30, 40)];
        cancelButtonBottom.backgroundColor = getColor(@"A7884A");
        [cancelButtonBottom setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButtonBottom setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cancelButtonBottom addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_bottonView addSubview:cancelButtonBottom];
        
    }
    return _shareBgView;
}

-(void)shareButtonEvent:(UIButton *)button{
    switch (button.tag) {
        case ShareButtonTagWeichatFriend:{
            
            break;
        }
        case ShareButtonTagWeichat:{
            
            break;
        }
        case ShareButtonTagSina:{
            
            break;
        }
        default:
            break;
    }
}

-(void)cancelButtonClick{
    [UIView animateWithDuration:0.25 delay:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _bottonView.frame = CGRectMake(0, DEF_SCREEN_HEIGHT, DEF_SCREEN_WIDTH, 150);
        [self.shareBgView removeFromSuperview];
    } completion:^(BOOL finished) {
        self.shareBgView.hidden = YES;
    }];
}

-(void)showShareView{
    [UIView animateWithDuration:0.25 animations:^{
        [self.navigationController.view addSubview:self.shareBgView];
        self.shareBgView.hidden = NO;
        _bottonView.frame = CGRectMake(0, DEF_SCREEN_HEIGHT - 170, DEF_SCREEN_WIDTH, 150);
    }];
}

-(void)backTo{
    [self cancelButtonClick];
    [super backTo];
}

#pragma mark WEB交互
-(void)WebViewJavascrip{
    __block id safeSelf = self;
    [WebViewJavascriptBridge enableLogging];
    _javascriptBridge = [WebViewJavascriptBridge bridgeForWebView:self.webView handler:^(id data, WVJBResponseCallback responseCallback)
                         {
                             [safeSelf resultsProcessing:data];
                         }];
}

-(void) webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    DEBUGLog(@"%@",webView);
    NSLog(@"didFailLoadWithError:%@", error);
    [self showMessage:@"网络连接失败"];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    DEBUGLog(@"=====:%@",request.URL);
    return YES;
}


#pragma mark - custemMeth
//加载网页
-(void)loadWebPage{
    if (self.webUrl == nil) {
        DEBUGLog(@"输入网址为空");
    }
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120]];
    [self.webView sizeToFit];
    
}

-(NSString *)getStringWithDictionary:(NSMutableDictionary *)dic{
    //将字典变成字符串输出
    NSString * string = @"";
    NSArray * keyArray = [dic allKeys];
    for (int i = 0; i < keyArray.count; i++) {
        //        string = [NSString stringWithFormat:@"%@&%@=%@",string, keyArray[i], [dic objectForKey:keyArray[i]]];
        if (i == 0) {
            string = [NSString stringWithFormat:@"%@=%@",keyArray[i], [dic objectForKey:keyArray[i]]];
        }else{
            string = [NSString stringWithFormat:@"%@&%@=%@",string, keyArray[i], [dic objectForKey:keyArray[i]]];
        }
    }
    return string;
}

/**
 *  webView返回结果的处理
 *
 *  @param data 返回的数据
 */
-(void)resultsProcessing:(NSDictionary *)data{

}

@end
