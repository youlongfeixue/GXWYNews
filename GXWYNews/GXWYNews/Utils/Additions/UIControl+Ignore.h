//
//  UIControl+Ignore.h
//  XHRelationship
//
//  Created by 王乐琦 on 16/8/16.
//  Copyright © 2016年 teaplant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIControl (Ignore)

@property (nonatomic, assign) NSTimeInterval ignoreTime;
@property (nonatomic, assign) BOOL isIgonre;

@end
