//
//  WYHomeViewController.m
//  WYNews
//
//  Created by Tony on 2018/1/24.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "WYHomeViewController.h"
#import "WYChannelView.h"
#import "WYChannelModel.h"
#import "WYNewsListController.h"

@interface WYHomeViewController ()

@property (nonatomic, strong) NSArray<WYChannelModel *> *channelList;

@property (nonatomic, weak) WYChannelView *channelView; 

@end

@implementation WYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    _channelList = [WYChannelModel channelList];
//    NSLog(@"chennelList = %@", _channelList);
    
    
    _channelView.channelList = _channelList;
}



#pragma mark - Actions



#pragma mark - delegates




#pragma mark - methods




#pragma mark - setupUI

- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    WYChannelView *cv = [WYChannelView channelView];
    [self.view addSubview:cv];
    self.channelView = cv;
    
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(38);
    }];
    
    // 设置分页控制器
    [self setupPageController];
}

/// 设置分页控制器
- (void)setupPageController {
    // 1. 实例化分页控制器
    UIPageViewController *pvc = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    // 2. 设置分页控制器的子控制器 （新闻列表控制器）
    WYNewsListController *listVc = [WYNewsListController new];
    [pvc setViewControllers:@[listVc] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // 3. 将分页视图控制器当做子控制器添加到当前控制器
    [self addChildViewController:pvc];
    
    // 4. 添加视图，并布局
    [self.view addSubview:pvc.view];
    
    [pvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.channelView.mas_bottom);
        make.left.bottom.right.equalTo(self.view);
    }];
    
    // 5. 完成添加
    [pvc didMoveToParentViewController:self];
}






#pragma mark - setter & getter







@end
