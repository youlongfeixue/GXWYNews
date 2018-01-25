//
//  NSURLSession+GXAddition.m
//  FenxiaoMS
//
//  Created by Sky on 2017/6/22.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "NSURLSession+GXAddition.h"

@implementation NSURLSession (GXAddition)

- (NSData *)gxDataWithUrl:(NSURL *)url responseRef:(NSURLResponse *__autoreleasing  _Nullable *)responseRef errorRef:(NSError *__autoreleasing  _Nullable *)errorRef
{
    return [self gxDataWithRequest:[NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:2.0] responseRef:responseRef errorRef:errorRef];
}

- (NSData *)gxDataWithRequest:(NSURLRequest *)request responseRef:(NSURLResponse *__autoreleasing  _Nullable *)responseRef errorRef:(NSError *__autoreleasing  _Nullable *)errorRef
{
//    __block bool needReturn = false;
    __block bool isResult = false;
    __block NSData *dataRet = nil;

    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //
        //        needReturn = error ? true : false; //如果错误，那么就需要返回了
        
        dataRet = data;
        *errorRef = error;
        *responseRef = response;
        
        isResult = true;
    }] resume];

    while (!isResult) {
        [NSThread sleepForTimeInterval:1.f/10];
    }

    return dataRet;
}









@end











