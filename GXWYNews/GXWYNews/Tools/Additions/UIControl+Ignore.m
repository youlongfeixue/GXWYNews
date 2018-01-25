//
//  UIControl+Ignore.m
//  XHRelationship
//
//  Created by 王乐琦 on 16/8/16.
//  Copyright © 2016年 teaplant. All rights reserved.
//

#import "UIControl+Ignore.h"

static char *const IgonreKey = "IgonreKey";
static char *const isIgonreKey = "isIgonreKey";
@implementation UIControl (Ignore)

+ (void)load{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(igonre_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)setIgnoreTime:(NSTimeInterval)ignoreTime{
    objc_setAssociatedObject(self, IgonreKey, @(ignoreTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)ignoreTime{
    return [objc_getAssociatedObject(self, IgonreKey) doubleValue];
}

- (void)setIsIgonre:(BOOL)isIgonre{
    if (isIgonre) {
        objc_setAssociatedObject(self, isIgonreKey, @"YES", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else {
        objc_setAssociatedObject(self, isIgonreKey, @"NO", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (BOOL)isIgonre{
    return [objc_getAssociatedObject(self, isIgonreKey) isEqualToString:@"YES"] ? YES : NO;
}

- (void)igonre_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.isIgonre) return;
    if (self.ignoreTime > 0)
    {
        self.isIgonre = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.ignoreTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.isIgonre = NO;
        });
        //@(NO)在release环境下是真
//        [self performSelector:@selector(setIsIgonre:) withObject:@(NO) afterDelay:self.ignoreTime];
    }
    [self igonre_sendAction:action to:target forEvent:event];
}

@end
