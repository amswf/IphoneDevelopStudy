//
//  AppViewController.h
//  NetRequest
//
//  Created by Amy on 14-1-8.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlueViewController.h"
#import "RedViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AppViewController : UIViewController<AVAudioPlayerDelegate>
{
    AVAudioPlayer *avAudioPlayer;
    UIProgressView *progressV;
    UISlider *volumeSlider;
    NSTimer *timer;
}
@property(readwrite,retain) BlueViewController *blueViewController;
@property(readwrite,retain) RedViewController *redViewController;
@end