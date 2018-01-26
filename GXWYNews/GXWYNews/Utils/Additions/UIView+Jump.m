//
//  UIView+Jump.m
//  FenxiaoMS
//
//  Created by Locke on 2017/3/30.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "UIView+Jump.h"

@implementation UIView (Jump)

#pragma mark - 获取当前view的viewcontroller
// 获取当前view的viewcontroller
+ (UIViewController *)getCurrentViewController:(UIView *) currentView
{
    for (UIView* next = [currentView superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
