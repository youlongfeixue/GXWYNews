//
//  AppDelegate.m
//  GXWYNews
//
//  Created by Tony on 2018/1/25.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    sleep(1.f);
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    Class cls = NSClassFromString(@"WYMainTabBarController");
    UIViewController *vc = [cls new];
    
    _window.rootViewController = vc;    
    [_window makeKeyAndVisible];
    
    return YES;
}



@end
