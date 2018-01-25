//
//  UILabel+GXAddition.h
//  

#import <UIKit/UIKit.h>
#import "UIView+GXAddition.h"

@interface UILabel (GXAddition)

//@property (nonatomic, assign) CGFloat lineSpacing;





#pragma mark - ——methods


/**
 create a UILabel with text: fontSize: color: .

 @param text     text
 @param fontSize fontSize
 @param color    color

 @return UILabel
 */
+ (instancetype)gx_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color;

/**
 create a UILabel with text: fontSize: color: . (No sizeToFit:)

 @param text     text
 @param fontSize fontSize
 @param color    color
 @return UILabel
 */
+ (instancetype)gx_labelFredom_WithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color;




+ (instancetype)gx_labelWithText:(NSString *)text boldFontSize:(CGFloat)fontSize color:(UIColor *)color;

+ (instancetype)gx_labelFredom_WithText:(NSString *)text boldFontSize:(CGFloat)fontSize color:(UIColor *)color;




+ (instancetype)gx_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment;
+ (instancetype)gx_labelFredom_WithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment;


+ (instancetype)gx_labelWithText:(NSString *)text boldFontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment;
+ (instancetype)gx_label_fredom_WithText:(NSString *)text boldFontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment;


+ (instancetype)gx_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize isBold:(BOOL)isBold color:(UIColor *)color alignment:(NSTextAlignment)alignment;
+ (instancetype)gx_labelFredom_WithText:(NSString *)text fontSize:(CGFloat)fontSize isBold:(BOOL)isBold color:(UIColor *)color alignment:(NSTextAlignment)alignment;



#pragma mark - ——line spacing 行距

/**
 设置文本和行距

 @param text 文本
 @param lineSpacing 行距
 */
- (void)gxSetText:(NSString *)text lineSpacing:(CGFloat)lineSpacing;
- (void)gxSetAttributedString:(NSAttributedString *)attrStr lineSpacing:(CGFloat)lineSpacing;




#pragma mark - ——calculate height

/// 计算Label的高度
- (CGFloat)heightWithText:(NSString *)text widthOfLabel:(CGFloat)width font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines;

/**
 计算Label的高度

 @param text Label的文本
 @param width Label的宽度
 @param lineSpacing 行间距
 @return 返回Label的高度
 */
- (CGFloat)heightWithText:(NSString *)text widthOfLabel:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;
- (CGFloat)heightWithAttrText:(NSAttributedString *)attrText widthOfLabel:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;






@end










