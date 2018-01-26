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


@end
