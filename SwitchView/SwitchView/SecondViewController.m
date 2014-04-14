//
//  SecondViewController.m
//  SwitchView
//
//  Created by Amy on 14-4-11.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"界面二";
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake((self.view.bounds.size.width - 100)/2, 150.0f, 100.0f, 30.0f);
    [button setTitle:@"切换到界面一" forState:UIControlStateNormal];
    // 最后一个参数：UIControlEvent表示你将要对button进行什么操作去触发绑定的方法（比如UIControlEventTouchUpInSide，表示  “点击button” 去触发方法
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

-(IBAction)buttonClick:(id)sender{
    [[AppDelegate App].viewController showFirstView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
