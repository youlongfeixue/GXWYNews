//
//  GXBaseView.m
//  GX_Base_OC
//
//  Created by Tony on 16/9/22.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "GXBaseView.h"
#import "UIView+GXAddition.h"

@implementation GXBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.backgroundColor = [UIColor whiteColor];
        [self initVariables_view];
        [self setupUI];
    }
    return self;
}

#pragma markl - setupUI
- (void)setupUI {
    //
    
    
}

- (void)initVariables_view {
    //
    
}



- (UIViewController *)gx_targetVc {
    if (!_gx_targetVc) {
        _gx_targetVc = [self getTargetVc];
    }
    return _gx_targetVc;
}

@end
