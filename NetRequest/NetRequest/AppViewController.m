//
//  AppViewController.m
//  NetRequest
//
//  Created by Amy on 14-1-8.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import "AppViewController.h"
#import <UIKit/UIKit.h>
#import "BlueViewController.h"
#import "RedViewController.h"

@interface AppViewController ()

@end

@implementation AppViewController
@synthesize blueViewController;
@synthesize redViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(120, 246, 80, 20);
    [button setTitle:@"切换" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(switchView:) forControlEvents:UIControlEventTouchDown];
    self.blueViewController = [[BlueViewController alloc] init];
    [self.view insertSubview:self.blueViewController.view atIndex:0];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake(100, 100, 60, 40)];
    [button1 setTitle:@"play" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(100, 150, 60, 40)];
    [button2 setTitle:@"pause" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setFrame:CGRectMake(100, 150, 60, 40)];
    [button3 setTitle:@"pause" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    NSString *string = [[NSBundle mainBundle] pathForResource:@"qiannv" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:string];
    
    avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    avAudioPlayer.delegate = self;
    
    avAudioPlayer.numberOfLoops = -1;
    
    [avAudioPlayer prepareToPlay];
    
    progressV = [[UIProgressView alloc] initWithFrame:CGRectMake(20, 50, 200, 200)];
    [self.view addSubview:progressV];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(playProgress) userInfo:nil repeats:YES];
    
    volumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 70, 200, 20)];
    
    [volumeSlider addTarget:self action:@selector(volumeChange) forControlEvents:UIControlEventValueChanged];
    
    volumeSlider.minimumValue = 0.0f;
    
    volumeSlider.maximumValue = 10.0f;
    
    volumeSlider.value = 5.0f;
    
    [self.view addSubview:volumeSlider];
    
    UISwitch *swith = [[UISwitch alloc] initWithFrame:CGRectMake(100, 20, 60, 40)];
    
    [swith addTarget:self action:@selector(onOrOff:) forControlEvents:UIControlEventValueChanged];
    
    swith.on = YES;
    
    [self.view addSubview:swith];
}
//切换
-(IBAction)switchView:(id)sender{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.view.window sendSubviewToBack:self.view];
    if (self.redViewController == nil) {
        self.redViewController = [[RedViewController alloc] init];
    }
    if (self.blueViewController.view.superview == nil) {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        [self.redViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    }else{
        if (self.redViewController.view.superview == nil) {
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
            [self.blueViewController.view removeFromSuperview];
            [self.view insertSubview:self.redViewController.view atIndex:0];
        }
    }
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)play{
    [avAudioPlayer play];
}

-(void)pause{
    [avAudioPlayer pause];
}

-(void)stop{
    avAudioPlayer.currentTime = 0;
    
    [avAudioPlayer stop];
}

-(void)playProgress{
    progressV.progress = avAudioPlayer.currentTime/avAudioPlayer.duration;
}

-(void)onOrOff:(UISwitch *)sender{
    avAudioPlayer.volume = sender.on;
}

- (void)volumeChange{
    avAudioPlayer.volume = volumeSlider.value;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [timer invalidate];
}
@end
