//
//  UIImage+GXAddition.m
//  

#import "UIImage+GXAddition.h"

@implementation UIImage (GXAddition)

    //圆角
- (void)gx_cornerImageWithSize:(CGSize)size
                     fillColor:(UIColor *)fillColor
                        radius:(CGFloat)radius
                    completion:(void (^)(UIImage * image))completionBlock 
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0); // NO-透明: 图片被裁掉的部分会透出背景颜色。
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
//        [fillColor setFill];
//        UIRectFill(rect);
        
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
        
        [path addClip];
        
        [self drawInRect:rect];
        
        UIImage * reltImg = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completionBlock) {
                completionBlock(reltImg);
            }
        });
    });
}

// 将一个突破按照给定比率等比例压缩
- (void)gxScaleImageByRatio:(CGFloat)ratio completion:(void (^)(UIImage *))completionBlock {
    NSAssert(completionBlock != nil, @"Error: completionBlock 未实现！");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        // scaleRect
        CGSize size = CGSizeMake(self.size.width * ratio, self.size.height * ratio);
        CGRect scaleRect = CGRectMake(0, 0, size.width, size.height);
        
        // drawing
        UIGraphicsBeginImageContext(size);
        [self drawInRect:scaleRect];
        UIImage *imgRes = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        completionBlock(imgRes);
    });
}

// 等比例缩放到指定尺寸  - 按照 UIViewContentModeScaleAspectFit 模式匹配最短边
- (void)gx_scaleImageToSize_proportioned:(CGSize)size completion:(void (^)(UIImage *))completionBlock
{
    NSAssert(completionBlock != nil, @"Error: completionBlock 未实现！");
    // imageSize:(320, 128), targetSize:(550, 80)
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        CGFloat width = self.size.width;
        CGFloat height = self.size.height;
        
        CGFloat targetW = size.width;
        CGFloat targetH = size.height;
        
        CGFloat scaleW = targetW;
        CGFloat scaleH = targetH;
        
        CGFloat scaleFactor = 0;
        CGFloat widthFactor = targetW / width;
        CGFloat heightFactor = targetH / height;
        
        CGPoint scalePoint = CGPointMake(0.f, 0.f);
        
        if (widthFactor > 1 && heightFactor > 1) //放大
        {
            scaleFactor = MIN(widthFactor, heightFactor); //放大 - 取小因子，得到的scaleSize比targetSize小，需要计算使scaleSize居中
            
            scaleW = width *scaleFactor;
            scaleH = height * scaleFactor;
            
            if (widthFactor > heightFactor) //heightFactor较小，以此为准则高度相等，宽度 scaleW < targetW，需要水平居中 
            {
                CGFloat scaleX = (targetW - scaleW) * 0.5f;
                scalePoint.x = scaleX;
            } 
            else //widthFactor较小，以此为准则宽度相等，高度 scaleH < targetH，需要垂直居中
            {
                CGFloat scaleY = (targetH - scaleH) * 0.5f;
                scalePoint.y = scaleY;
            }
        }
        else if (widthFactor < 1 && heightFactor < 1) //缩小
        {
            scaleFactor = MAX(widthFactor, heightFactor); //缩小 - 取大因子，得到的scaleSize比targetSize小，需要计算使scaleSize居中
            
            scaleW = width *scaleFactor;
            scaleH = height * scaleFactor;
            
            if (widthFactor > heightFactor) //heightFactor较小，以此为准则宽度相等，高度 scaleH < targetH，需要垂直居中
            {
                CGFloat scaleY = (targetH - scaleH) * 0.5f;
                scalePoint.y = scaleY;  
            } 
            else //widthFactor较小，依次为准则则高度相等，宽度 scaleW < targetW，需要水平居中
            {
                CGFloat scaleX = (targetW - scaleW) * 0.5f;
                scalePoint.x = scaleX;
            }
        }
        else //缩放
        {
            scaleFactor = MIN(widthFactor, heightFactor); //有缩有放 - 取小因子满足短边（满足缩短的边）
            
            scaleW = width * scaleFactor;
            scaleH = height * scaleFactor;
            
            if (widthFactor > heightFactor) //heightFactor较小，以此为准则高度相等（缩短之后），宽度 scaleW < targetW，需要水平居中
            {
                CGFloat scaleX = (targetW - scaleW) * 0.5f;
                scalePoint.x = scaleX;
            } 
            else //widthFactor较小，以此为准则宽度相等（缩短之后），高度 scaleH < targetH，需要垂直居中
            {
                CGFloat scaleY = (targetH - scaleH) * 0.5f;
                scalePoint.y = scaleY;
            }
        }
        
        // scaleRect
        CGRect scaleRect = CGRectMake(scalePoint.x, scalePoint.y, scaleW, scaleH);
        
        // drawing
        UIGraphicsBeginImageContext(size);
        [self drawInRect:scaleRect];
        UIImage *imgRes = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        completionBlock(imgRes);
    });
}

// 等比例缩放到指定尺寸  - 按照 UIViewContentModeScaleAspectFit 模式匹配最短边
- (void)gx_scaleImageToSize:(CGSize)size completion:(void (^)(UIImage *))completionBlock
{
    NSAssert(completionBlock != nil, @"Error: completionBlock 未实现！");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        // scaleRect
        CGRect scaleRect = CGRectMake(0, 0, size.width, size.height);
        
        // drawing
        UIGraphicsBeginImageContext(size);
        [self drawInRect:scaleRect];
        UIImage *imgRes = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        completionBlock(imgRes);
    });
}


/* 根据给定信息创建二维码 */
+ (CIImage *)gx_createCIQRCodeImageWithCodeMsg:(NSString *)codeMsg
{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    [filter setValue:[codeMsg dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
    return [filter outputImage];
}

/* 根据CIImage二维码生成指定大小的高清二维码UIImage */
+ (UIImage *)gx_createNonInterpolatedUIImageFromCIImage:(CIImage *)CIQRImg size:(CGFloat)len
{
    CGRect extent = CGRectIntegral(CIQRImg.extent);
    CGFloat scale = len / MIN(CGRectGetWidth(extent), CGRectGetHeight(extent));
    
    //1. 创建bitmap
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef csR = CGColorSpaceCreateDeviceGray();
    
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, csR, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImg = [context createCGImage:CIQRImg fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImg);
    
    //2. 保存bitmap图片
    CGImageRef scaledImg = CGBitmapContextCreateImage(bitmapRef);
    
    //3. release
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImg);
    
    return [UIImage imageWithCGImage:scaledImg];
}

/* 根据给定信息生成高清二维码UIImage */
+ (UIImage *)gx_createQRUIImageWithCodeMsg:(NSString *)codeMsg size:(CGFloat)len
{   CIImage *qrimg = [self gx_createCIQRCodeImageWithCodeMsg:codeMsg];
    return [self gx_createNonInterpolatedUIImageFromCIImage:qrimg size:len];
}







@end












