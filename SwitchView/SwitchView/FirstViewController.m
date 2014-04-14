//
//  FirstViewController.m
//  SwitchView
//
//  Created by Amy on 14-4-11.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
@interface FirstViewController ()

@end

@implementation FirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"界面一";
    self.view.backgroundColor = [UIColor brownColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake((self.view.bounds.size.width - 100)/2, 100.0f, 100.0f, 30.0f);
    [button setTitle:@"切换到界面二" forState:UIControlStateNormal];
    // 最后一个参数：UIControlEvent表示你将要对button进行什么操作去触发绑定的方法（比如UIControlEventTouchUpInSide，表示  “点击button” 去触发方法
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

-(IBAction)buttonClick:(id)sender{
    [[AppDelegate App].viewController showSecondView];
}

@end
