//
//  Iterator.h
//  test
//
//  Created by LK_Git on 2017/3/15.
//  Copyright © 2017年 连凯软件. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Iterator <NSObject>

@required
/**
 * 判断数组是否还有元素
 */
-(BOOL) hasNext;
/**
 * 返回数组中的元素（索引为0的元素），必须先使用hasNext判断,否则可能出现数组越界异常
 */
-(NSObject *) next;
/**
 * 删除数组中的元素（索引为0的元素），必须先使用hasNext判断,否则可能出现数组越界异常
 */
-(void) remove;

@end
