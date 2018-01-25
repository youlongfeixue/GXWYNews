//
//  UIViewController+GXAddition.h
//

#import <UIKit/UIKit.h>

@interface UIViewController (GXAddition)


/**
 添加子控制器到当前控制器

 @param childVc 待添加的子控制器
 @param toView  目标view视图
 */
- (void)gx_addChildController:(UIViewController *)childVc intoView:(UIView *)toView;

@end
