//
//  NSDate+GBSAddition.m
//  FenxiaoMS
//
//  Created by liankai on 2017/2/4.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "NSDate+GBSAddition.h"

@implementation NSDate (GBSAddition)

- (BOOL)after:(NSDate *)otherDate{
    if ([[self laterDate:otherDate] isEqualToDate:self]) {// self晚
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)before:(NSDate *)otherDate{
    if ([[self earlierDate:otherDate] isEqualToDate:self]) {// self早
        return YES;
    } else {
        return NO;
    }
}

@end
