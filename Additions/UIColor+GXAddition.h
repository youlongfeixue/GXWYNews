//
//  UIColor+GXAddition.h
//  

#import <UIKit/UIKit.h>

@interface UIColor (GXAddition)

#pragma mark - Properties



#pragma mark - Methods


/**
 color with RGB.

 @param red   red
 @param green green
 @param blue  blue

 @return color
 */
+ (instancetype)gx_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;


/**
 color with HEX.

 @param hex hex

 @return color
 */
+ (instancetype)gx_colorWithHex:(uint32_t)hex;


/**
 random color.

 @return random Color
 */
+ (instancetype)gx_randomColor;



/**
 color with HEX string.

 @param color hex string
 
 @return color
 */
+ (UIColor *)colorWithHexString: (NSString *)color;

@end
