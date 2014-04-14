//
//  MusicPlayerViewController.h
//  amy
//
//  Created by Amy on 13-8-11.
//  Copyright (c) 2013年 Amy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AVFoundation/AVAudioPlayer.h"

@interface MusicPlayerViewController : UIViewController <AVAudioPlayerDelegate>
{
    AVAudioPlayer *avAudioPlayer;   //播放器player
    UIProgressView *progressV;      //播放进度
    UISlider *volumeSlider;         //声音控制
    NSTimer *timer;                 //监控音频播放进度
}
@end
