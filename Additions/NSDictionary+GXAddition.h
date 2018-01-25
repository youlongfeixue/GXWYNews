//
//  NSDictionary+GXAddition.h
//  FenxiaoMS
//
//  Created by Sky on 2017/8/2.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (GXAddition)

- (NSString *)dictToString;

- (NSDictionary *)clone;

@end



@interface NSMutableDictionary (GXAddition)

- (void)clear;

- (BOOL)containsKey:(id)key;
- (BOOL)containsObj:(id)obj;

@end













