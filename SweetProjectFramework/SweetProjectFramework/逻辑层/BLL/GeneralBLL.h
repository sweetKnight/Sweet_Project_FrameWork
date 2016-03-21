//
//  GeneralBLL.h
//  SweetProjectFramework
//
//  Created by 冯剑锋 on 16/3/18.
//  Copyright © 2016年 冯剑锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"

@interface GeneralBLL : NSObject

/*!
 *  通用的一个请求接口
 *
 *  @param parameters 请求参数
 *  @param POST       请求地址(除去公用的地址头)
 *  @param block      返回参数用的block
 *
 *  @return 网络请求
 */
+(NSURLSessionDataTask*)returnCommonResultModelHttpRequestWithParameters:(NSDictionary*)parameters POST:(NSString*)POST resultBlock:(void(^)(NSDictionary* commentReturnModel, NSError*error))block;

/*!
 *  用于图片上传的一个接口
 *
 *  @param parameters 图片以外的参数
 *  @param imageArray 图片数组
 *  @param POST       请求地址
 *  @param block      返回用block
 *
 *  @return 没用
 */
+(NSURLSessionDataTask*)uploadImagesWithParameters:(NSDictionary*)parameters Images:(NSArray *)imageArray POST:(NSString*)POST resultBlock:(void(^)(NSDictionary* commentReturnModel, NSError*error))block;

@end
