//
//  MusicPlayerViewController.m
//  amy
//
//  Created by Amy on 13-8-11.
//  Copyright (c) 2013年 Amy. All rights reserved.
//

#import "MusicPlayerViewController.h"

@interface MusicPlayerViewController ()

@end

@implementation MusicPlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    NSString *str = @"fsd";
    [str length];
    return self;
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self play];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化三个button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(100, 100, 60, 40)];
    [button setTitle:@"Play" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake(100, 150, 60, 40)];
    [button1 setTitle:@"pause" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(100, 200, 60, 40)];
    [button2 setTitle:@"stop" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    //从budle路径下读取音频文件　　轻音乐 - 萨克斯回家 这个文件名是你的歌曲名字,mp3是你的音频格式
    NSString *string = [[NSBundle mainBundle] pathForResource:@"gou" ofType:@"mp3"];
    //把音频文件转换成url格式
    NSURL *url = [NSURL fileURLWithPath:string];
    //初始化音频类 并且添加播放文件
    avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    //设置代理
    avAudioPlayer.delegate = self;
    //设置初始音量大小
    // avAudioPlayer.volume = 1;
    //设置音乐播放次数  -1为一直循环
    avAudioPlayer.numberOfLoops = -1;
    //预播放
    [avAudioPlayer prepareToPlay];
    //初始化一个播放进度条
    progressV = [[UIProgressView alloc] initWithFrame:CGRectMake(20, 50, 200, 20)];
    [self.view addSubview:progressV];
    //用NSTimer来监控音频播放进度
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
                                           selector:@selector(playProgress)
                                           userInfo:nil repeats:YES];
    //初始化音量控制
    volumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 70, 200, 20)];
    [volumeSlider addTarget:self action:@selector(volumeChange)
           forControlEvents:UIControlEventValueChanged];
    //设置最小音量
    volumeSlider.minimumValue = 0.0f;
    //设置最大音量
    volumeSlider.maximumValue = 10.0f;
    //初始化音量为多少
    volumeSlider.value = 5.0f;
    [self.view addSubview:volumeSlider];
    //声音开关控件(静音)
    UISwitch *swith = [[UISwitch alloc] initWithFrame:CGRectMake(100, 20, 60, 40)];
    [swith addTarget:self action:@selector(onOrOff:) forControlEvents:UIControlEventValueChanged];
    //默认状态为打开
    swith.on = YES;
    [self.view addSubview:swith];
}

- (void)play{
    [avAudioPlayer play];
}

- (void)pause{
    [avAudioPlayer pause];
}
- (void)stop{
    avAudioPlayer.currentTime = 0;  //当前播放时间设置为0
    [avAudioPlayer stop];
}
- (void)playProgress{
    progressV.progress = avAudioPlayer.currentTime/avAudioPlayer.duration;
}
- (void)onOrOff:(UISwitch *)sender{
    avAudioPlayer.volume = sender.on;
}
- (void)volumeChange{
    avAudioPlayer.volume = volumeSlider.value;
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [timer invalidate]; //NSTimer暂停   invalidate  使...无效;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
