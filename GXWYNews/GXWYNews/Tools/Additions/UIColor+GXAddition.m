//
//  UIColor+GXAddition.m
//  

#import "UIColor+GXAddition.h"

@implementation UIColor (GXAddition)



//


//
+ (instancetype)gx_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

+ (instancetype)gx_colorWithHex:(uint32_t)hex {
    //
    uint8_t r = (hex & 0xFF0000) >> 16;
    uint8_t g = (hex & 0x00FF00) >> 8;
    uint8_t b = (hex & 0x0000FF);
    
    return [self gx_colorWithRed:r green:g blue:b];
}

+ (instancetype)gx_randomColor {
    return [UIColor gx_colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
}
+ (UIColor *)colorWithHexString:(NSString *)color
{
    NSString *coString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([coString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([coString.lowercaseString hasPrefix:@"0X".lowercaseString])
        coString = [coString substringFromIndex:2];
    if ([coString hasPrefix:@"#"])
        coString = [coString substringFromIndex:1];
    if ([coString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [coString substringWithRange:range];
    range.location = 2;
    NSString *gString = [coString substringWithRange:range];
    range.location = 4;
    NSString *bString = [coString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
@end
