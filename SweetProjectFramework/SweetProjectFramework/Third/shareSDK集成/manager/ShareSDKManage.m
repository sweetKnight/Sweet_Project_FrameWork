//
//  ShareSDKManage.m
//  SweetProjectFramework
//
//  Created by 冯剑锋 on 16/3/23.
//  Copyright © 2016年 冯剑锋. All rights reserved.
//

#import "ShareSDKManage.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WeiboSDK.h"
#import "WXApi.h"
#import <MBProgressHUD.h>

@implementation ShareSDKManage



/**
 *  分享
 *
 *  @param shareType 分享类型
 */
+ (void)shareHandlerByShareType:(ShareType)shareType prameDic:(NSDictionary*)dic backBlock:(void(^)(BOOL isSUC))backBlcok
{
    NSString*title=[dic objectForKey:@"title"];
    NSString *titleOther;
    if ([dic allValues].count==4) {
        titleOther=[dic objectForKey:@"otherTitle"];
    }else{
        titleOther=title;
    }
    if (shareType==ShareTypeSinaWeibo) {
        title=[[dic objectForKey:@"title"] stringByAppendingString:[dic objectForKey:@"url"]];
    }
    if (shareType==ShareTypeWeixiSession) {
        //微信好友
        if ([dic allValues].count==4) {
            title=[dic objectForKey:@"otherTitle"];
            titleOther=[dic objectForKey:@"title"];
        }else{
            titleOther=title;
        }
    }
    if (shareType==ShareTypeWeixiTimeline) {
        //朋友圈
        if ([dic allValues].count==4) {
            titleOther=[dic objectForKey:@"otherTitle"];
            title=[dic objectForKey:@"title"];
        }else{
            titleOther=title;
        }
    }
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:[dic objectForKey:@"imageURL"]]];
    
    //创建分享内容
    id<ISSContent> publishContent = [ShareSDK content:title
                                       defaultContent:title
                                                image:[ShareSDK imageWithData:data fileName:@"pict" mimeType:@"image/png"]
                                                title:titleOther
                                                  url:[dic objectForKey:@"url"]
                                          description:title
                                            mediaType:SSPublishContentMediaTypeNews];
    /*
     //显示分享菜单
     //客户端分享（仅支持新浪微博、微信、QQ、Pinterest、Google+）
     
     [ShareSDK clientShareContent:publishContent //内容对象
     type:shareType //平台类型
     statusBarTips:YES
     result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {//返回事件
     
     if (state == SSPublishContentStateSuccess)
     {
     NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功!"));
     
     backBlcok(YES);
     }
     else if (state == SSPublishContentStateFail)
     {
     NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败!"), [error errorCode], [error errorDescription]);
     backBlcok(NO);
     NSLog(@"%@--%ld",[error errorDescription],[error errorCode]);
     }
     }];
     
     */
    
    
    
    
    //显示编辑框
    [ShareSDK showShareViewWithType:shareType
                          container:nil
                            content:publishContent
                      statusBarTips:YES
                        authOptions:nil
                       shareOptions:nil
                             result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 
                                 if (state == SSPublishContentStateSuccess)
                                 {
                                     NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"发表成功"));
                                     backBlcok(YES);
                                 }
                                 else if (state == SSPublishContentStateFail)
                                 {
                                     NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                     backBlcok(NO);
                                 }
                                 else if (state == SSPublishContentStateCancel)
                                 {
                                     NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                     backBlcok(NO);
                                 }
                             }];
}

+(void)shareLogin:(ShareType)shareType showHUDforView:(UIView *) view backBlock:(void(^)(NSDictionary * returnDic))backBlcok{
    MBProgressHUD*progressHUD=[MBProgressHUD showHUDAddedTo:view animated:YES];
    progressHUD.removeFromSuperViewOnHide=YES;
    ShareType type=shareType;
    [ShareSDK getUserInfoWithType:type
                      authOptions:nil
                           result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                               if (result) {
                                   NSLog(@"uid = %@",[userInfo uid]);
                                   NSLog(@"name = %@",[userInfo nickname]);
                                   NSLog(@"icon = %@",[userInfo profileImage]);
                                   
                                   NSString*thirdType=@"";
                                   if (type==ShareTypeQQSpace) {thirdType=@"1";}
                                   if (type==ShareTypeSinaWeibo) {thirdType=@"2";}
                                   if (type==ShareTypeWeixiSession) {thirdType=@"3";}
                                   NSDictionary*prameDic=@{@"username":[userInfo nickname],
                                                           @"thirdUid":[userInfo uid],
                                                           @"thirdType":thirdType,
                                                           @"isSuccessful":@"YES"};
                                   if (backBlcok) {
                                       backBlcok(prameDic);
                                   }
                                   
                               }else{
                                   progressHUD.mode=MBProgressHUDModeText;
                                   progressHUD.labelText=[error errorDescription];
                                   [progressHUD hide:YES afterDelay:1.2];
                                   NSDictionary*prameDic=@{@"username":@"",
                                                           @"thirdUid":@"",
                                                           @"thirdType":@"",
                                                           @"isSuccessful":@"YES"};
                                   if (backBlcok) {
                                       backBlcok(prameDic);
                                   }
                               }
                           }];
    [progressHUD hide:YES afterDelay:1.2];
}

+(void)shareRegistered{
    //1.初始化ShareSDK应用,字符串"iosv1101"是应该换成你申请的ShareSDK应用中的Appkey
    [ShareSDK registerApp:@"7891e58d3359"];
    /**
     连接新浪微博开放平台应用以使用相关功能，此应用需要引用SinaWeiboConnection.framework
     http://open.weibo.com上注册新浪微博开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectSinaWeiboWithAppKey:@"3437716616"
                               appSecret:@"8ba40e86f49e6984ab43a6bbc4b1f0b0"
                             redirectUri:@"https://api.weibo.com/oauth2/default.html"];
    //添加QQ空间应用  注册网址  http://connect.qq.com/intro/login/
    [ShareSDK connectQZoneWithAppKey:@"1104575751"
                           appSecret:@"OiQioKSJT3A1IWG6"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    /**
     连接微信应用以使用相关功能，此应用需要引用WeChatConnection.framework和微信官方SDK
     http://open.weixin.qq.com上注册应用，并将相关信息填写以下字段
     **/
    [ShareSDK connectWeChatWithAppId:@"wxf6aef4317944790c"
                           appSecret:@"cb21bff0fcfbb9830bbf8b4957962440"
                           wechatCls:[WXApi class]];
    
    //微信登陆的时候需要初始化
    [ShareSDK connectWeChatWithAppId:@"wxf6aef4317944790c"
                           appSecret:@"cb21bff0fcfbb9830bbf8b4957962440"
                           wechatCls:[WXApi class]];
}


@end
