//
//  ShareSDKManage.h
//  SweetProjectFramework
//
//  Created by 冯剑锋 on 16/3/23.
//  Copyright © 2016年 冯剑锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>
@interface ShareSDKManage : NSObject
/*!
 *  分享通用方法
 *
 *  @param shareType 分享类型(分享到那个平台)
 *  @param dic       分享参数@{@"url":@"",@"imageURL":@"",@"title":@""}
 *  @param backBlcok 分享结果返回
 */
+(void)shareHandlerByShareType:(ShareType)shareType prameDic:(NSDictionary*)dic backBlock:(void(^)(BOOL isSUC))backBlcok;
/*!
 *  三方登录的平台
 *
 *  @param shareType 平台类型
 *  @param view      要添加风火轮的view
 */
+(void)shareLogin:(ShareType)shareType showHUDforView:(UIView *)view backBlock:(void(^)(NSDictionary * returnDic))backBlcok;
/*!
 *  APPdelegate中注册上方登录的方法参数自己修改
 */
+(void)shareRegistered;
@end
