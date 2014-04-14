//
//  SwitcherViewController.h
//  SwitchView
//
//  Created by Amy on 14-4-11.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface SwitcherViewController : UIViewController
@property (nonatomic,retain) FirstViewController * firstviewcontroller;
@property (nonatomic,retain) SecondViewController* secondviewcontroller;
-(void)initView;
-(void)showFirstView;
-(void)showSecondView;
-(void)removeAllView;
@end
