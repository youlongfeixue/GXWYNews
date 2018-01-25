//
//  GXBaseLabel.h
//  FenxiaoMS
//
//  Created by Tony on 2017/3/10.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+GXAddition.h"

@interface GXBaseLabel : UILabel

///字体样式
@property (nonatomic, assign) BOOL isBold;

- (void)setupUI;

@end
