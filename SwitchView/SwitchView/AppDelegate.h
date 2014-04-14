//
//  AppDelegate.h
//  SwitchView
//
//  Created by Amy on 14-4-11.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwitcherViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) SwitcherViewController *viewController;

+(AppDelegate *)App;
@end
