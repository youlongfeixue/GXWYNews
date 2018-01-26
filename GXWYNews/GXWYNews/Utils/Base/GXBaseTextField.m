//
//  GXBaseTextField.m
//  FenxiaoMS
//
//  Created by Tony on 2017/11/2.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "GXBaseTextField.h"
#import "Masonry.h"

@interface GXBaseTextField ()

@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UIView *cView;

@end

@implementation GXBaseTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        [self setupUI];
    }
    return self;
}


- (void)initUI {
    
}

- (void)setupUI {
//    NSLog(@"子类实现");
}





- (void)cviewTapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"textF cviewTapAction.");
    
    if ([self.gxBaseDelegate respondsToSelector:@selector(gxTextField:touchWithEnabled:)]) {
        [self.gxBaseDelegate gxTextField:self touchWithEnabled:self.isEnabled];
    }
}

- (UIView *)cView {
    if (!_cView) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cviewTapAction:)];
        _cView = [[UIView alloc] init]; //WithFrame:self.frame];
        [_cView addGestureRecognizer:_tap];
        _cView.backgroundColor = [UIColor clearColor];
        [self.superview addSubview:_cView];
        [_cView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self);
        }];
    }
    return _cView;
}


- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    self.textColor = enabled ? [UIColor blackColor] : [UIColor grayColor];
    self.cView.hidden = enabled;
}


@end
