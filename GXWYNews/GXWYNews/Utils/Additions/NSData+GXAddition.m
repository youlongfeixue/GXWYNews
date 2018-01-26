//
//  NSData+GXAddition.m
//  FenxiaoMS
//
//  Created by Sky on 2017/8/18.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "NSData+GXAddition.h"

@implementation NSData (GXAddition)


- (NSString *)data2hexString
{
    Byte *bytes = (Byte *)[self bytes];
    NSString *hexStr = @"";
    for(int i = 0; i < [self length]; i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x", bytes[i] & 0xff];//16进制数
        if([newHexStr length] == 1)
            hexStr = [NSString  stringWithFormat:@"%@0%@", hexStr, newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@", hexStr, newHexStr];
    }
    return hexStr;
}




@end
