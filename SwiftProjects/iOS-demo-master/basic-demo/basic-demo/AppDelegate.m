//
//  AppDelegate.m
//  basic-demo
//
//  Created by wutong on 2019/9/2.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AppDelegate.h"

#import "AWBaseTabBarController.h"
#import "AWBaseNavigationController.h"

#import "AWNewsViewController.h"
#import "AWVideoViewController.h"
#import "AWRecommendViewController.h"
#import "AWMineViewController.h"
#import "AFNetworking.h"
#import "AWSplashView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    AWBaseTabBarController *tbController = [[AWBaseTabBarController alloc] init];
    
    AWNewsViewController *newsController = [[AWNewsViewController alloc] init];
    AWVideoViewController *videoController = [[AWVideoViewController alloc] init];
    AWRecommendViewController *recommendController = [[AWRecommendViewController alloc] init];
    AWMineViewController *mineController = [[AWMineViewController alloc] init];
    
    [tbController setViewControllers:@[newsController, videoController, recommendController, mineController]];
    
    AWBaseNavigationController *navController = [[AWBaseNavigationController alloc] initWithRootViewController:tbController];
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    // 闪屏
    [self.window addSubview:({
        AWSplashView *splashView = [[AWSplashView alloc] initWithFrame:self.window.bounds];
        splashView;
    })];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
