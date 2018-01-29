//
//  AppDelegate.m
//  GXWYNews
//
//  Created by Tony on 2018/1/25.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 设置网络指示器  “小菊花”
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;    
    
    // 设置统一外观 - appearance 在 window 创建前设置
    [self setupAppearance];
    
    
//    sleep(1.f);
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
//    Class cls = NSClassFromString(@"WYMainTabBarController");
    Class cls = NSClassFromString(@"WYNewsListController");
    
    UIViewController *vc = [cls new];
    
    _window.rootViewController = vc;    
    [_window makeKeyAndVisible];
    
    return YES;
}

- (void)setupAppearance {
    [UITabBar appearance].tintColor = [UIColor gx_colorWithHex:0xDF0000];
}




@end
