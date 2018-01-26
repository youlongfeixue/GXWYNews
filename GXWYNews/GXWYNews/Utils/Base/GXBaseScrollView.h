//
//  GXBaseScrollView.h
//  GX_Base_OC
//

#import <UIKit/UIKit.h>
#import "UIScrollView+GXAddition.h"


typedef NS_ENUM(NSInteger, ScrollDirect) {
    DirectNone = 0,
    DirectLeft,
    DirectRight
};

@interface GXBaseScrollView : UIScrollView

#pragma mark  --------  以下 4 个属性专为 左右滑动的嵌套控件使用  -------- 

/// 1. 当前 pan 收拾拖动的方向
@property (nonatomic, assign) ScrollDirect scrollDirect;
/// scrollView 当前的 contentOffsetX
@property (nonatomic, assign) CGFloat currentOffseetX;
/// scrollView 最大的 contentOffsetX（滑动到最左边）
@property (nonatomic, assign) CGFloat maxOffsetX;
/// scrollView 最小的 contentOffsetX = 0（滑动到最右边）
@property (nonatomic, assign) CGFloat minOffsetX;



/// 设置视图
- (void)setupUI;

@end
