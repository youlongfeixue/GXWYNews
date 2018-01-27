//
//  GXNetWorkManager+WYCategory.m
//  GXWYNews
//
//  Created by Tony on 2018/1/27.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "GXNetWorkManager+WYCategory.h"

@implementation GXNetWorkManager (WYCategory)

- (void)newListWithChannel:(NSString *)channel start:(NSInteger)start completion:(void (^)(NSArray *list, NSError *error))completion
{
    NSString *urlStr = [NSString stringWithFormat:@"list/%@/%zd-20.html", channel, start];
    [self GET:urlStr parameters:nil completion:^(id json, NSError *error) {
//        NSLog(@"json = %@", json);
        
        // 从 json 中取出频道数据，使用 ‘channel’ 作为 key 获取数组
        NSArray *array = json[channel];
        completion(array, error);
    }];
}














@end











