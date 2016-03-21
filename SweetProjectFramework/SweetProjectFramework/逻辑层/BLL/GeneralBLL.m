//
//  GeneralBLL.m
//  SweetProjectFramework
//
//  Created by 冯剑锋 on 16/3/18.
//  Copyright © 2016年 冯剑锋. All rights reserved.
//

#import "GeneralBLL.h"
#import <UIKit/UIKit.h>

@implementation GeneralBLL

//返回json结构为CommenReturnModel的HTTP请求
+(NSURLSessionDataTask*)returnCommonResultModelHttpRequestWithParameters:(NSDictionary*)parameters POST:(NSString*)POST resultBlock:(void(^)(NSDictionary* commentReturnModel, NSError*error))block{
    return [[AFAppDotNetAPIClient sharedClient] POST:POST parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        DEBUGLog(@"%@",parameters);
        NSAssert([responseObject isKindOfClass:[NSDictionary class]], @"JSON结构返回与约定不符");
        
        if (block) {
            block(parameters, nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+(NSURLSessionUploadTask *)uploadImagesWithParameters:(NSDictionary*)parameters Images:(NSArray<UIImage *> *)imageArray POST:(NSString*)POST resultBlock:(void(^)(NSDictionary* commentReturnModel, NSError*error))block{
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:[NSString stringWithFormat:@"%@%@",AFAppDotNetAPIBaseURLString, POST] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        //向表单中中加入图片数据
        [imageArray enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSData *mydata0 = UIImageJPEGRepresentation( obj, 0.4);
            [formData appendPartWithFileData:mydata0 name:@"file0" fileName:@"mainPicture0.jpg" mimeType:@"image/jpeg"];
        }];
        
    } error:nil];
    
    NSProgress *progress = nil;
    
    
    NSURLSessionUploadTask *uploadTask = [[AFAppDotNetAPIClient sharedClient] uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            if (block) {
                block(responseObject, nil);
            }
        }else{
            if (block) {
                block(nil, error);
            }
        }
    }];
    [uploadTask resume];
    return nil;
}

@end
