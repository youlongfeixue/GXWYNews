//
//  NSArray+Addition.m
//  FenxiaoMS
//
//  Created by Sky on 2017/11/2.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "NSArray+Addition.h"

/**
 category NSArray
 */
@implementation NSArray (Addition)











@end





/**
 category NSMutableArray
 */
@implementation NSMutableArray (Addition)

- (BOOL)addAll:(NSArray *)array {
    @try {
        [self addObjectsFromArray:array];
    } @catch (NSException *e) {
        return NO;
    }
    return YES;
}









@end










