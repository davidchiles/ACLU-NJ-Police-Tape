//
//  LecturePlayerViewController.h
//  LectureLeaks
//
//  Created by Christopher Ballinger on 6/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Recording.h"


@interface LecturePlayerViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate> {
    Recording* recording;
    int duration;
    BOOL isPlaying;
    AVAudioPlayer* player;
    
    UILabel *durationLabel;
    UILabel *currentTimeLabel;  
    NSTimer *playerUpdateTimer;
    UISlider *playerSlider;
    UIBarButtonItem *playButton;
    UIBarButtonItem *stopButton;
    UIBarButtonItem *submitButton;
    
    UITextField *nameTextField;
    UITextField *publicDescriptionTextField;
    UITextField *privateDescriptionTextField;
    UIProgressView *progressView;
    UILabel *submitLabel;
    UISwitch *locationSwitch;
}
@property (nonatomic) IBOutlet UISwitch *locationSwitch;
@property (nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic) IBOutlet UITextField *privateDescriptionTextField;
@property (nonatomic) IBOutlet UITextField *publicDescriptionTextField;
@property (nonatomic) IBOutlet UITextField *nameTextField;
@property (nonatomic) Recording* recording;
@property (nonatomic) IBOutlet UILabel *durationLabel;
@property (nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (nonatomic)     NSTimer *playerUpdateTimer;
@property (nonatomic) IBOutlet UISlider *playerSlider;
@property (nonatomic) IBOutlet UIBarButtonItem *playButton;
@property (nonatomic) IBOutlet UIBarButtonItem *stopButton;
@property (nonatomic) IBOutlet UIBarButtonItem *submitButton;
@property (nonatomic)     AVAudioPlayer* player;

- (IBAction)submitPressed:(id)sender;
- (IBAction)playPressed:(id)sender;
- (IBAction)stopPressed:(id)sender;
- (void) updateElapsedTime:(NSTimer *) timer;
- (void) updateLabel:(UILabel*)label withTime:(NSTimeInterval)time;
- (IBAction)seek:(id)sender;
@property (nonatomic) IBOutlet UILabel *submitLabel;

@end
