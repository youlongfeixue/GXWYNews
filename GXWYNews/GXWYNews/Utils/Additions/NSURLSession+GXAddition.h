//
//  NSURLSession+GXAddition.h
//  FenxiaoMS
//
//  Created by Sky on 2017/6/22.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSURLSession (GXAddition)

/**
 同步的URLSession请求（适用于返回数据较小的情况）
 - 默认响应时间为2秒

 @param url url description
 @param responseRef &response 传进来response的地址
 @param errorRef &error 传进来error的地址
 @return 返回服务器的响应流
 */
- (NSData * _Nullable)gxDataWithUrl:(NSURL * _Nonnull)url responseRef:(NSURLResponse * _Nullable *_Nonnull)responseRef errorRef:(NSError * _Nullable *_Nullable)errorRef;


/**
 同步的URLSession请求（适用于返回数据较小的情况）

 @param request request description
 @param responseRef &response 传进来response的地址
 @param errorRef &error 传进来error的地址
 @return 返回服务器的响应流
 */
- (NSData * _Nullable)gxDataWithRequest:(NSURLRequest * _Nonnull)request responseRef:(NSURLResponse * _Nullable *_Nonnull)responseRef errorRef:(NSError * _Nullable *_Nullable)errorRef;









@end










