//
//  UIPickerView+GXAddition.m
//  FenxiaoMS
//
//  Created by Ssky on 2017/5/5.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "UIPickerView+GXAddition.h"

@implementation UIPickerView (GXAddition)


- (void)clearSeparator {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.frame.size.height < 1.f) {
            [obj setBackgroundColor:[UIColor clearColor]];
        }
    }];
}












@end
