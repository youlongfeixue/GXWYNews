//
//  NSObject+GXAddition.m
//  

#import "NSObject+GXAddition.h"

@implementation NSObject (GXAddition)

//- (NSString *)gx_toString {
////    return [NSString stringWithFormat:@"%@", self];
//    
//    NSString * str = [NSString stringWithFormat:@"%@", self];
//    return str;
//}



- (NSString *)toString 
{
    NSString *returnStr = @"";
    if ([self isKindOfClass:[NSUUID class]]) 
    {
        returnStr = [(NSUUID *)self UUIDString].lowercaseString;
//        returnStr = [NSString stringWithFormat:@"%@", self].lowercaseString;
    }
    else 
    {
        returnStr = [NSString stringWithFormat:@"%@", self];
    }
    return returnStr;
}


@end
