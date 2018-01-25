//
//  NSDate+GBSAddition.h
//  FenxiaoMS
//
//  Created by liankai on 2017/2/4.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GBSAddition)

/**
 是否晚
 */
- (BOOL)after:(NSDate *)otherDate;

/**
 是否早
 */
- (BOOL)before:(NSDate *)otherDate;

@end
