//
//  AppDelegate.m
//  Study
//
//  Created by Amy on 13-8-1.
//  Copyright (c) 2013年 Amy. All rights reserved.
//

#import "AppDelegate.h"
#import "Calculator.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //***************程序调试函数****************
    NSLog(@"hello world!");//obc里面的trace能够输出程序里面的变量，方便调试
    //***************变量定义*******************
    int a,b;
    a = 2;
    b = 3;
    NSLog(@"a,b=%i,%i",a,b);
    //***************类定义和调用****************
    Calculator *calc = [[Calculator alloc] init];
    [calc setNumerator:1];
    [calc setDenominator:5];
    [calc set:1:3];
    [calc print];
    //循环
    int num;
    num = 0;
    for (int n =0; n <5; n++) {
        num += n;
        NSLog(@"%i",num);
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
