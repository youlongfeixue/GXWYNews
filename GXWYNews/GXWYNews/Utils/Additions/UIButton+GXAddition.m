//
//  UIButton+GXAddition.m
//

#import "UIButton+GXAddition.h"

@implementation UIButton (GXAddition)

+ (instancetype)gx_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor
{
    //
    UIButton * button = [[self alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    
    normalColor = !normalColor ? [UIColor blackColor] : normalColor;
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    
    selectedColor = !selectedColor ? normalColor : selectedColor;
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button.titleLabel sizeToFit];
    
    //    button.backgroundColor = [UIColor whiteColor];
    
    [button sizeToFit];
    
    return button;
}

+ (instancetype)gx_textButton:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor
{
    return [self gx_textButton:title fontSize:fontSize normalColor:titleColor selectedColor:[UIColor grayColor]];
}


+ (instancetype)gx_textButton:(NSString *)title boldFontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor
{
    //
    UIButton * button = [[self alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    
    normalColor = !normalColor ? [UIColor blackColor] : normalColor;
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    
    selectedColor = !selectedColor ? normalColor : selectedColor;
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    
    button.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    [button.titleLabel sizeToFit];
    
    //    button.backgroundColor = [UIColor whiteColor];
    
    [button sizeToFit];
    
    return button;
}

+ (instancetype)gx_textButton:(NSString *)title boldFontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor
{
    return [self gx_textButton:title boldFontSize:fontSize normalColor:titleColor selectedColor:titleColor];
}


//+ (instancetype)gx_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor titleAlignment:(NSTextAlignment)titleAlignment
//{
//    UIButton * button = [self gx_textButton:title fontSize:fontSize normalColor:normalColor selectedColor:selectedColor];
//    [button.titleLabel setTextAlignment:titleAlignment];
//    return button;
//}

- (void)gx_setBgNormalColor:(UIColor *)bgNormalColor bgSelectedColor:(UIColor *)bgSelectedColor {
    //    self.backgroundColor = self.isSelected ? bgSelectedColor : bgNormalColor;
    // use KVO to solve this problem.
}

- (void)gx_setBgNormalImage:(UIImage *)bgNormalImage bgHighlightedImage:(UIImage *)bgHighlightedImage {
    [self setBackgroundImage:bgNormalImage forState:UIControlStateNormal];
    [self setBackgroundImage:bgHighlightedImage forState:UIControlStateHighlighted];
}

- (void)gx_setBgImageWithNormalName:(NSString *)normalName highlightedName:(NSString *)highlightedName {
    [self gx_setBgNormalImage:[UIImage imageNamed:normalName] bgHighlightedImage:[UIImage imageNamed:highlightedName]];
}


- (void)gx_setBgNormalImage:(UIImage *)bgNormalImage selectedImage:(UIImage *)selectedImage {
    [self setBackgroundImage:bgNormalImage forState:UIControlStateNormal];
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

- (void)gx_setBgImageWithNormalName:(NSString *)normalName selectedImgName:(NSString *)selectedName {
    [self gx_setBgNormalImage:[UIImage imageNamed:normalName] selectedImage:[UIImage imageNamed:selectedName]];
}

//-(void)setHighlighted:(BOOL)highlighted { }



/// setup button`s common attributes with ordinary font。 普通字体
- (void)gx_setTitle:(NSString *)title font:(UIFont *)font normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.titleLabel.font = font;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
}

/// setup button`s common attributes with bold font。 使用加粗字体
- (void)gx_setTitle:(NSString *)title boldFont:(UIFont *)boldFont normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor
{
    [self gx_setTitle:title font:boldFont normalColor:normalColor highLightColor:highLightColor];
    self.titleLabel.font = boldFont;
}


/// setup button`s common attributes with ordinary font。 普通字体
- (void)gx_setTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor
{
    [self gx_setTitle:title font:[UIFont systemFontOfSize:fontSize] normalColor:normalColor highLightColor:highLightColor];
}

/// setup button`s common attributes with bold font。 使用加粗字体
- (void)gx_setTitle:(NSString *)title boldFontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor 
{
    [self gx_setTitle:title boldFont:[UIFont boldSystemFontOfSize:fontSize] normalColor:normalColor highLightColor:highLightColor];
}












@end











