//
//  UILabel+GXAddition.m
//  

#import "UILabel+GXAddition.h"
#import <objc/runtime.h> 


@implementation UILabel (GXAddition)

char *lineSpacingKey = "lineSpacingKey";

//- (void)setLineSpacing:(CGFloat)lineSpacing {
//    objc_setAssociatedObject(self, lineSpacingKey, @(lineSpacing), OBJC_ASSOCIATION_ASSIGN);
//}
//
//- (CGFloat)lineSpacing {
//    return [objc_getAssociatedObject(self, lineSpacingKey) floatValue];
//}



+ (instancetype)gx_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color
{
    UILabel * label = [[self alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
//    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    if (!color) { color = [UIColor blackColor]; }
    label.textColor = color;
    
    [label sizeToFit];
    
    return label;
}

+ (instancetype)gx_labelFredom_WithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color
{
    UILabel * label = [[self alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    
    if (!color) { color = [UIColor blackColor]; }
    label.textColor = color;
    
    return label;
}



+ (instancetype)gx_labelWithText:(NSString *)text boldFontSize:(CGFloat)fontSize color:(UIColor *)color
{
    UILabel *label = [self gx_labelWithText:text fontSize:fontSize color:color];
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    return label;
}

+ (instancetype)gx_labelFredom_WithText:(NSString *)text boldFontSize:(CGFloat)fontSize color:(UIColor *)color
{
    UILabel * label = [[self alloc] init];
    
    label.text = text;
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    label.numberOfLines = 0;
    
    if (!color) { color = [UIColor blackColor]; }
    label.textColor = color;
    
    return label;
}



+ (instancetype)gx_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    UILabel *label = [self gx_labelWithText:text fontSize:fontSize color:color];
    label.textAlignment = alignment;
    return label;
}

+ (instancetype)gx_labelFredom_WithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    UILabel *label = [self gx_labelFredom_WithText:text fontSize:fontSize color:color];
    label.textAlignment = alignment;
    return label;
}




+ (instancetype)gx_labelWithText:(NSString *)text boldFontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    UILabel *label = [self gx_labelWithText:text boldFontSize:fontSize color:color];
    label.textAlignment = alignment;
    return label;
}

+ (instancetype)gx_label_fredom_WithText:(NSString *)text boldFontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    UILabel *label = [self gx_labelFredom_WithText:text boldFontSize:fontSize color:color];
    label.textAlignment = alignment;
    return label;
}




+ (instancetype)gx_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize isBold:(BOOL)isBold color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    UILabel *label;
    if (isBold) {
        label = [self gx_labelWithText:text boldFontSize:fontSize color:color alignment:alignment];
    } else {
        label = [self gx_labelWithText:text fontSize:fontSize color:color alignment:alignment];
    }
    return label;
}

+ (instancetype)gx_labelFredom_WithText:(NSString *)text fontSize:(CGFloat)fontSize isBold:(BOOL)isBold color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    UILabel *label = nil;
    if (isBold) {
        label = [self gx_label_fredom_WithText:text boldFontSize:fontSize color:color alignment:alignment];
    } else {
        label = [self gx_labelFredom_WithText:text fontSize:fontSize color:color alignment:alignment];
    }
    return label;
}







#pragma mark - ——line spacing 行距

/**
 设置文本和行距
 
 @param text 文本
 @param lineSpacing 行距
 */
- (void)gxSetText:(NSString *)text lineSpacing:(CGFloat)lineSpacing
{
    if (!text || lineSpacing < 0.01) {
        self.text = text;
        return;
    }
    
    [self gxSetAttributedString:[[NSAttributedString alloc] initWithString:text] lineSpacing:lineSpacing];    
}

- (void)gxSetAttributedString:(NSAttributedString *)attrStr lineSpacing:(CGFloat)lineSpacing 
{   
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithAttributedString:attrStr];
    NSRange range = NSMakeRange(0, mAttr.length);
    
    NSMutableParagraphStyle *mParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    [mParagraphStyle setLineSpacing:lineSpacing];
    [mParagraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    
    [mAttr addAttribute:NSParagraphStyleAttributeName value:mParagraphStyle range:range];
    
    self.attributedText = mAttr.copy;
}








#pragma mark - ——calculate height

- (CGFloat)heightWithText:(NSString *)text widthOfLabel:(CGFloat)width font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [UILabel new];
    label.font = font;
    label.numberOfLines = numberOfLines;
    label.text = text;
    [label sizeToFit];
    return label.bounds.size.height;
}


/**
 计算Label的高度
 
 @param text Label的文本
 @param width Label的宽度
 @param lineSpacing 行间距
 @return 返回Label的高度
 */
- (CGFloat)heightWithText:(NSString *)text widthOfLabel:(CGFloat)width lineSpacing:(CGFloat)lineSpacing
{
    UILabel *label = [[UILabel alloc] init];
    label.font = self.font;
    label.numberOfLines = self.numberOfLines;
    [label gxSetText:text lineSpacing:lineSpacing];
    [label sizeToFit];
    
    return label.bounds.size.height;
}

- (CGFloat)heightWithAttrText:(NSAttributedString *)attrText widthOfLabel:(CGFloat)width lineSpacing:(CGFloat)lineSpacing
{
    UILabel *label = [[UILabel alloc] init];
    label.font = self.font;
    label.numberOfLines = self.numberOfLines;
    [label gxSetAttributedString:attrText lineSpacing:lineSpacing];
    [label sizeToFit];
    
    return label.bounds.size.height;
}

























@end











