//
//  WYChannelLabel.m
//  GXWYNews
//
//  Created by Tony on 2018/1/30.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "WYChannelLabel.h"
#import "UILabel+GXAddition.h"

static CGFloat kNormalSize = 14.f;
static CGFloat kSelectedSize = 18.f;

@implementation WYChannelLabel

+ (instancetype)channelLabelWithTitle:(NSString *)title {
    WYChannelLabel *lb = [self gx_labelWithText:title fontSize:kSelectedSize color:nil];
    
    lb.textAlignment = NSTextAlignmentCenter;
    
    /*
     - 因为不是自动布局，所以 frame 不能实时变化；
     
     - 使用大字体实例化并 sizeToFit 撑起来空间；后面设置较小的字体，仍占大空间，为选中字体变大做准备。
     
     */
    
    lb.font = [UIFont systemFontOfSize:kNormalSize];
    
    return lb;
}














@end
