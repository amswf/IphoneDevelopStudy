//
//  AppDelegate.h
//  UINavigationController
//
//  Created by Amy on 14-4-1.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) RootViewController *viewController;

@property (strong, nonatomic) UINavigationController *navController;
@end
