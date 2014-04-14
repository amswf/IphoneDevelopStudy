//
//  AppDelegate.m
//  SwitchView
//
//  Created by Amy on 14-4-11.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import "AppDelegate.h"
#import "SwitcherViewController.h"
@implementation AppDelegate
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    viewController = [[SwitcherViewController alloc] init];
    [viewController initView];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

+(AppDelegate *)App{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
