//
//  GXNetWorkManager.h
//  GXWYNews
//
//  Created by Tony on 2018/1/27.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface GXNetWorkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;


#pragma mark -  封装 AFN 网络请求

#pragma mark -  GET

- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void (^)(id json, NSError *error))completion;

#pragma mark -  POST









@end










