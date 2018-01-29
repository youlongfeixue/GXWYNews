//
//  WYMainTabBarController.m
//  WYNews
//
//  Created by Tony on 2018/1/24.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "WYMainTabBarController.h"

@interface WYMainTabBarController ()

@end

@implementation WYMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}












#pragma mark -  添加子控制器

/// 添加所有的子控制器 
- (void)addChildViewControllers {
    
    // 设置bar字体的颜色
//    self.tabBar.tintColor = [UIColor gx_colorWithHex:0xDF0000];
    
    // 视图控制器的字典数组
    NSArray *arr = @[
                     @{@"clsName": @"WYHomeViewController", @"title": @"新闻", @"imageName": @"news"},
                     @{@"clsName": @"UIViewController", @"title": @"阅读", @"imageName": @"reader"},
                     @{@"clsName": @"UIViewController", @"title": @"视频", @"imageName": @"media"},
                     @{@"clsName": @"UIViewController", @"title": @"话题", @"imageName": @"bar"},
                     @{@"clsName": @"UIViewController", @"title": @"我", @"imageName": @"me"},
                     ];
    
    // 遍历数组，创建子控制器数组
    NSMutableArray *vcsM = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        [vcsM addObject:[self childViewControllerWithDict:dict]];
    }
    
    self.viewControllers = vcsM.copy;
}


/// 添加一个子控制器
- (UIViewController *)childViewControllerWithDict:(NSDictionary *)dict {
    
    // 1. create vc
    NSString *clsName = dict[@"clsName"];
    Class cls = NSClassFromString(clsName);
    
    NSAssert(cls != nil, @"传入的控制器类名错误！");
    UIViewController *vc = [cls new];
    
    // 2. set title
    vc.title = dict[@"title"];
    
    // 3. set img 
    NSString *imgName = [NSString stringWithFormat:@"tabbar_icon_%@_normal", dict[@"imageName"]];
    vc.tabBarItem.image = [UIImage imageNamed:imgName];    
    
    NSString *imgNameHL = [NSString stringWithFormat:@"tabbar_icon_%@_highlight", dict[@"imageName"]];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:imgNameHL] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 4. add nav vc
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    // 5. return vc
    return nav;
}







@end












