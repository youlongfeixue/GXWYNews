//
//  GXBaseView.h
//  GX_Base_OC
//
//  Created by Tony on 16/9/22.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+GXAddition.h"
#import "UIView+Jump.h" //view所在的控制器
#import "UIView+Extension.h" //view的坐标和尺寸简化

@interface GXBaseView : UIView

///view所属的控制器
@property (nonatomic, weak) UIViewController *gx_targetVc;

/// 初始化数据
- (void)initVariables_view;

/// 设置视图
- (void)setupUI;

@end
