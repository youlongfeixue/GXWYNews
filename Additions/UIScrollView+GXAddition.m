//
//  UIScrollView+GXAddition.m
//  FenxiaoMS
//
//  Created by Ssky on 2017/4/21.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "UIScrollView+GXAddition.h"

@implementation UIScrollView (GXAddition)







@end




/**
 UIScrollView + UITouch
 */
@implementation UIScrollView (UITouch)


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //    Class cls = [self class];
    //    NSLog(@"atatcls = %@", cls);
    //    NSLog(@"scrollView = %@", self);
    
    //    if (![self isMemberOfClass:[UIScrollView class]]) {
    //        
    //        if ([self isKindOfClass:[UIScrollView class]]) {
    //            
    //            NSLog(@"scrollView = %@", self);
    //        }
    //        
    //        return;
    //    }
    
    // "UIKeyboardCandidateCollectionView"
    // "UIKBCandidateCollectionView"
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([[self class] isEqual:NSClassFromString(@"UIKBCandidateCollectionView")]) {
        return;
    }
    
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([[self class] isEqual:NSClassFromString(@"UIKBCandidateCollectionView")]) {
        return;
    }
    
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}





@end






