//
//  NSNumber+GXAddition.m
//  CarSalesMS_GCX
//
//  Created by Ssky on 2016/11/7.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "NSNumber+GXAddition.h"

@implementation NSNumber (GXAddition)

- (NSString *)gx_toString {
    return [NSString stringWithFormat:@"%@", self];
}

- (NSDecimalNumber *)gx_toDecimalNumber {
    return [NSDecimalNumber decimalNumberWithString:self.description];
}









@end
