//
//  UIViewController+GXAddition.m
//  

#import "UIViewController+GXAddition.h"

@implementation UIViewController (GXAddition)

- (void)gx_addChildController:(UIViewController *)childVc intoView:(UIView *)toView {
    //
    [self addChildViewController:childVc];
    [toView addSubview:childVc.view];
    [childVc didMoveToParentViewController:self];
}

@end
