//
//  WYChannelModel.m
//  GXWYNews
//
//  Created by Tony on 2018/1/30.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "WYChannelModel.h"

@implementation WYChannelModel

+ (NSArray *)channelList 
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"topic_news.json" withExtension:nil]; //扩展名
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    NSArray *arr = dict[@"tList"];
    
    NSArray *modelList = [NSArray yy_modelArrayWithClass:[self class] json:arr];
    
    NSArray *result = [modelList sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //
        return [((WYChannelModel *)obj1).tid compare:((WYChannelModel *)obj2).tid]; //asc
    }];
    
    return result;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\ntname: %@ \ntid: %@", _tname, _tid];
}

@end
