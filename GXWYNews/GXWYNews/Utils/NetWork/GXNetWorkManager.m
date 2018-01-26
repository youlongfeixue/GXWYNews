//
//  GXNetWorkManager.m
//  GXWYNews
//
//  Created by Tony on 2018/1/27.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "GXNetWorkManager.h"

@implementation GXNetWorkManager

+ (instancetype)sharedManager {
    static GXNetWorkManager *_instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 末尾反斜线
        NSURL *baseUrl = [NSURL URLWithString:@"http://c.m.163.com/nc/article/"];
        
        _instance = [[self alloc] initWithBaseURL:baseUrl];
    });
    return _instance;
}

#pragma mark -  封装 AFN 网络请求

#pragma mark -  GET

- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void (^)(id json, NSError *error))completion
{
    [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        completion(responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        completion(nil, error);
    }];
}



#pragma mark -  POST





@end











