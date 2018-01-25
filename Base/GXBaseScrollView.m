//
//  GXBaseScrollView.m
//  GX_Base_OC
//

#import "GXBaseScrollView.h"

@implementation GXBaseScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI

- (void)setupUI {
    //
    
}


- (CGFloat)currentOffseetX {
    return self.contentOffset.x;
}

- (CGFloat)maxOffsetX {
    CGFloat currOS = self.contentSize.width - self.bounds.size.width;
    return currOS > 0 ? currOS : 0;
}

- (CGFloat)minOffsetX {
    return 0;
}

@end
