//
//  NSMutableArray+Helper.h
//  test
//
//  Created by LK_Git on 2017/3/15.
//  Copyright © 2017年 连凯软件. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Iterator.h"

@interface NSMutableArray(Helper)

/**
 *
 * 返回一个迭代器
 */
-(id<Iterator> ) iterator;


@end
