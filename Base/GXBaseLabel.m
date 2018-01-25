//
//  GXBaseLabel.m
//  FenxiaoMS
//
//  Created by Tony on 2017/3/10.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "GXBaseLabel.h"

@implementation GXBaseLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor whiteColor];
        [self setUserInteractionEnabled:YES];
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
}



#pragma mark - setter & getter

- (void)setIsBold:(BOOL)isBold {
    _isBold = isBold;
    
    CGFloat fontSize = self.font.pointSize;
    if (_isBold) {
        self.font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        self.font = [UIFont boldSystemFontOfSize:fontSize];
    }
}






@end
