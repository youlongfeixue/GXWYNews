//
//  UIButton+GXAddition.h
//  

#import <UIKit/UIKit.h>

@interface UIButton (GXAddition)


/**
 Create text button.

 @param title         title
 @param fontSize      fontSize
 @param normalColor   normalColor
 @param selectedColor selectedColor

 @return UIButton
 */
+ (instancetype)gx_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;

+ (instancetype)gx_textButton:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor;


+ (instancetype)gx_textButton:(NSString *)title boldFontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;

+ (instancetype)gx_textButton:(NSString *)title boldFontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor;


///**
// Create text button with txtAlignment.
// 
// @param title         title
// @param fontSize      fontSize
// @param normalColor   normalColor
// @param selectedColor selectedColor
// @param titleAlignment title alignment
//
// @return UIButton
// */
//+ (instancetype)gx_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor titleAlignment:(NSTextAlignment)titleAlignment;


/**
 /////////////////////
 set background color for normal and selected.

 @param bgNormalColor   bgNormalColor
 @param bgSelectedColor bgSelectedColor
 */
- (void)gx_setBgNormalColor:(UIColor *)bgNormalColor bgSelectedColor:(UIColor *)bgSelectedColor;


/**
 set background image for normal and highlighted.

 @param bgNormalImage      bgNormalImage
 @param bgHighlightedImage bgHighlightedImage
 */
- (void)gx_setBgNormalImage:(UIImage *)bgNormalImage bgHighlightedImage:(UIImage *)bgHighlightedImage;
- (void)gx_setBgImageWithNormalName:(NSString *)normalName highlightedName:(NSString *)highlightedName;


/**
 set background image for normal and selected.

 @param bgNormalImage bgNormalImage
 @param selectedImage selectedImage
 */
- (void)gx_setBgNormalImage:(UIImage *)bgNormalImage selectedImage:(UIImage *)selectedImage;
- (void)gx_setBgImageWithNormalName:(NSString *)normalName selectedImgName:(NSString *)selectedName;



/// setup button`s common attributes with ordinary font。 普通字体
- (void)gx_setTitle:(NSString *)title font:(UIFont *)font normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor;
/// setup button`s common attributes with bold font。 使用加粗字体
- (void)gx_setTitle:(NSString *)title boldFont:(UIFont *)boldFont normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor;

/// setup button`s common attributes with ordinary font。 普通字体
- (void)gx_setTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor;
/// setup button`s common attributes with bold font。 使用加粗字体
- (void)gx_setTitle:(NSString *)title boldFontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor;






@end
