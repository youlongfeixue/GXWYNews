//
//  UIImageView+gx_WebImage.m
//  GXWYNews
//
//  Created by Tony on 2018/1/29.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "UIImageView+gx_WebImage.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (gx_WebImage)

// 使用 urlStr 设置网络图片
- (void)gx_setImageWithURLString:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    
    if (url != nil) {
        [self sd_setImageWithURL:url];
    }
}



@end
