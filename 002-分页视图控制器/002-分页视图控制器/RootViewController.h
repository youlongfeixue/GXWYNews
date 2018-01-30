//
//  RootViewController.h
//  002-分页视图控制器
//
//  Created by Tony on 2018/1/30.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

