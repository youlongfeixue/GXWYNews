//
//  UIImage+GXAddition.h
//  

#import <UIKit/UIKit.h>

@interface UIImage (GXAddition)


/**
 根据当前图像和指定尺寸以及圆角半径，生成圆角图像，并返回。

 @param size            指定尺寸
 @param fillColor       边缘填充颜色
 @param radius          圆角半径
 @param completionBlock 回调block，将生成的圆角图像回传
 */
- (void)gx_cornerImageWithSize:(CGSize)size
                     fillColor:(UIColor *)fillColor
                        radius:(CGFloat)radius
                    completion:(void (^)(UIImage * image))completionBlock;


/// 将一个突破按照给定比率等比例压缩  - ratio: 比率/质量 0~1（在 Android 中的范围是 1~100 ，100 代表压缩 100 % ，就是不压缩）
- (void)gxScaleImageByRatio:(CGFloat)ratio completion:(void(^)(UIImage *imgResult))completionBlock;

/**
 将一个图片按照给定尺寸 ”等比例“ 缩放
 - 按照 UIViewContentModeScaleAspectFit 模式匹配最短边
 
 @param size 给定新大小
 @param completionBlock 回传缩放后的图片
 */
- (void)gx_scaleImageToSize_proportioned:(CGSize)size completion:(void(^)(UIImage *imgResult))completionBlock;


/**
 将一个图片按照给定尺寸缩放（可能会拉伸）
 
 @param size 给定新大小
 @param completionBlock 回传缩放后的图片
 */
- (void)gx_scaleImageToSize:(CGSize)size completion:(void(^)(UIImage *imgResult))completionBlock;

/**
 根据给定信息创建二维码

 @param codeMsg 给定信息
 @return 二维码CIImage
 */
+ (CIImage *)gx_createCIQRCodeImageWithCodeMsg:(NSString *)codeMsg;

/**
 根据CIImage二维码生成指定大小的高清二维码UIImage

 @param CIQRImg CIQRImg description
 @param len 给定高清二维码边长
 @return 生成的高清UIImage
 */
+ (UIImage *)gx_createNonInterpolatedUIImageFromCIImage:(CIImage *)CIQRImg size:(CGFloat)len;

/**
 根据给定信息生成高清二维码UIImage

 @param codeMsg 给定信息
 @param len 给定高清二维码的边长
 @return 生成的高清UIImage
 */
+ (UIImage *)gx_createQRUIImageWithCodeMsg:(NSString *)codeMsg size:(CGFloat)len;









@end











