//
//  UIControl+GXAddition.m
//  

#import "UIControl+GXAddition.h"

@implementation UIControl (GXAddition)

/**
 判断当前触摸点是否在其内部
 
 @param event 当前触发的事件
 
 @return 返回是否在其内部
 */
- (BOOL)gx_isTouchedPointInsideWithEvent:(UIEvent *)event {
    BOOL isIn = CGRectContainsPoint(self.bounds, [[[event allTouches] anyObject] locationInView:self]) ? YES : NO;
    return isIn;
}

@end
