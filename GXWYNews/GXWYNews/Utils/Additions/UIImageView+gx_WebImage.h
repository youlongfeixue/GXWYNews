//
//  UIImageView+gx_WebImage.h
//  GXWYNews
//
//  Created by Tony on 2018/1/29.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (gx_WebImage)

/// 使用 urlStr 设置网络图片
- (void)gx_setImageWithURLString:(NSString *)urlStr;


@end
