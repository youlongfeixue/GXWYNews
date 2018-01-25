//
//  NSDictionary+GXAddition.m
//  FenxiaoMS
//
//  Created by Sky on 2017/8/2.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "NSDictionary+GXAddition.h"

@implementation NSDictionary (GXAddition)

- (NSString *)dictToString {
    NSString *str = @"";
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"error");
    }
    else if (data) {
        str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return str;
}


- (NSDictionary *)clone{
    return self.mutableCopy;
}


@end




@implementation NSMutableDictionary (GXAddition)

- (void)clear {
    [self removeAllObjects];
}

- (BOOL)containsKey:(id)key {
    if ([self.allKeys containsObject:key]) {
        return YES;
    }
    return NO;
}

- (BOOL)containsObj:(id)obj {
    if ([self.allValues containsObject:obj]) {
        return YES;
    }
    return NO;
}

@end













