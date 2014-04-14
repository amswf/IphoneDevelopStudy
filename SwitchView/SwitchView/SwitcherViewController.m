//
//  SwitcherViewController.m
//  SwitchView
//
//  Created by Amy on 14-4-11.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import "SwitcherViewController.h"

@interface SwitcherViewController ()

@end

@implementation SwitcherViewController

@synthesize firstviewcontroller;
@synthesize secondviewcontroller;

-(void)initView{
    if(self.firstviewcontroller == nil){
        self.firstviewcontroller = [[FirstViewController alloc] init];
    }
    [self removeAllView];
    [self.view insertSubview:self.firstviewcontroller.view atIndex:0];
}

-(void)showFirstView{
    if(self.firstviewcontroller == nil){
        self.firstviewcontroller = [[FirstViewController alloc] init];
    }
    [self removeAllView];
    [self.view insertSubview:self.firstviewcontroller.view atIndex:0];
}
-(void)showSecondView{
    if(self.secondviewcontroller == nil){
        self.secondviewcontroller = [[SecondViewController alloc] init];
    }
    [self removeAllView];
    [self.view insertSubview:self.secondviewcontroller.view atIndex:0];
}
-(void)removeAllView{
    for(NSInteger i=0;i<[self.view.subviews count];i++){
        [[self.view.subviews objectAtIndex:i] removeFromSuperview];
    }
}

@end
