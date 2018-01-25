//
//  UIView+Jump.h
//  FenxiaoMS
//
//  Created by Locke on 2017/3/30.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Jump)

#pragma mark - 获取当前view的viewcontroller
/// 获取当前view的viewcontroller
+ (UIViewController *)getCurrentViewController:(UIView *) currentView;

@end
