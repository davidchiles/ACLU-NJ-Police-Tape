//
//  ACLU_EULAViewController.m
//  CopRecorder
//
//  Created by David Chiles on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ACLU_EULAViewController.h"

@interface ACLU_EULAViewController ()

@end

@implementation ACLU_EULAViewController

@synthesize scrollView;

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
    // Do any additional setup after loading the view from its nib.
    
    self.scrollView.scrollEnabled = YES;
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, scrollView.frame.size.width, 900)];
    textView.backgroundColor = [UIColor clearColor];
    textView.textAlignment = UITextAlignmentCenter;
    //textView.clipsToBounds = NO;
    textView.scrollEnabled = NO;
    textView.font = [UIFont systemFontOfSize:16.0];
    
    [self.scrollView addSubview:textView];
    
    textView.text =  @"The American Civil Liberties Union of New Jersey (\"ACLU-NJ\") is a private, non-profit organization devoted to defending the principles of freedom, justice and equality outlined in the Bill of Rights of the United States Constitution. The ACLU-NJ has worked diligently to protect citizens' First Amendment rights and to ensure police accountability. Recording police officers while they perform their public duties fits squarely within both areas. We are therefore proud, in conjunction with OpenWatch.net, to provide this ACLU-NJ Police Tape App (\"the App\"). The ACLU-NJ believes that citizens enjoy the right to film police officers as they perform their duties in public spaces. That right is not without limits. The right to tape is limited by the right of public access. In other words, a person cannot record from areas where the police can legitimately exclude him (within a line of police tape, for example). In some situations, resisting commands made by law enforcement, even unlawful commands, can lead to an arrest or otherwise expose a person to criminal liability. While the ACLU-NJ believes that the United States and the New Jersey Constitutions protect the right to film or record officers in public, some states take a contrary view. For that reason, the ACLU-NJ Police Accountability App is designed for use only in New Jersey. Before you use the App in another state or jurisdiction, please consult applicable laws and court decisions. Information that is recorded and submitted via the App will be posted on the OpenWatch.net's publically available website and will also be submitted to the ACLUNJ for their use in advocating for better, more accountable police practices. DO NOT submit recordings that you do not wish to expose to public view. If you believe the recording contains information that may subject you to criminal or civil liability or undermine your ability to pursue legal remedies, you may wish to consult an attorney prior to submitting your recording. I agree that I am responsible for any recordings that I make using the App. Neither the ACLU-NJ nor OpenWatch.net is responsible if my recording breaks any laws, subjects me to civil liability, or affects my ability to pursue legal remedies. Information that is recorded and submitted via the ACLU-NJ Police Tape App will be posted on the OpenWatch.net website and submitted to the ACLU-NJ for their use in advocating for better, more accountable police practices. DO NOT submitted recordings that you do not wish to expose to public view. If you believe that a recording contains information that may subject you to criminal or civil liability or undermine your ability to pursue legal remedies, you may wish to consult an attorney prior to submitting your recording.";
    
    
    CGRect rect = textView.frame;
    rect.size.height = textView.contentSize.height;
    textView.frame = rect;
    
    UIToolbar * toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, textView.frame.size.height, self.scrollView.frame.size.width, 44)];
    
    UIBarButtonItem * agreeButton = [[UIBarButtonItem alloc] initWithTitle:@"Agree" style:UIBarButtonItemStyleDone target:self action:@selector(agreeButtonPressed:)];
    
    [toolbar setItems:[NSArray arrayWithObject:agreeButton]];
    
    [self.scrollView addSubview:toolbar];
    
    CGSize cSize = CGSizeMake(320, textView.frame.size.height+toolbar.frame.size.height);
    
    [scrollView setContentSize:cSize];
    
    
    
    
}

-(void)agreeButtonPressed:(id)sender
{
    NSUserDefaults * prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"agreed" forKey:@"EULA"];
    
    [self dismissModalViewControllerAnimated:YES];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome, new Watcher!" message:@"Whenever you think you are about to interact with an authority figure or a person in a position of power, start Cop Recorder and press Record. \n\nThis app will allow you to submit a recording, description, and location to OpenWatch.net.\n\nIf you record audio in Stealth Mode, the screen will go black while recording. When the encounter is over, simply close the application and it will stop the recording. On the next launch it will ask you if you'd like to load your unsubmitted recording. After loading you can preview the recording and submit it to OpenWatch.\n\nFor best audio quality, put the phone in your front shirt pocket, or on a nearby table with the microphone facing upwards.\n\nWhen uploading, please describe the incident. It will be reviewed by the editors and quickly published to OpenWatch.net. If you request, we will remove all of the personally identifiable information we can. No logs are kept on the server.\n\nAll uploads are released under the Creative-Commons-Attribution license.\n\nCourage is contagious!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
