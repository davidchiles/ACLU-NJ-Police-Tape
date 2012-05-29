//
//  ACLUAboutViewController.m
//  CopRecorder
//
//  Created by David Chiles on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ACLUAboutViewController.h"

@interface ACLUAboutViewController ()

@end

@implementation ACLUAboutViewController

@synthesize webView, donateButton;

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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"About";
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)];
    
    
    UIBarButtonItem * moreInfoButton = [[UIBarButtonItem alloc] initWithTitle:@"More Info" style:UIBarButtonItemStyleBordered target:self action:@selector(moreInfoButtonPressed:)];
    
    [self.navigationItem setLeftBarButtonItem:doneButton animated:YES];
    [self.navigationItem setRightBarButtonItem:moreInfoButton];
    
    
    [donateButton addTarget:self action:@selector(donateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}



- (void) doneButtonPressed:(id)sender
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void) moreInfoButtonPressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"About Cop Recorder" message:@"Cop Recorder is a subproject of OpenWatch. OpenWatch is a participatory citizen media project aiming to provide documentary evidence of uses and abuses of power.\n\nUntil now, surveillance technology has only been in the hands of those who are already in power, which means it cannot be used to combat the largest problem facing modern society: abuse of power.\n\nSo the question remains: Who watches the watchers? \n\nThis is where OpenWatch comes in. Now, we are all opportunistic journalists. Whenever any of us come in contact with power being used or abused, we can capture it and make it become part of the public record. If we seek truth and justice, we will be able to appeal to documentary evidence, not just our word against theirs. Ideally, this will mean less corruption, more open government and a more transparent society.\n\nOpenWatch is not only intended to display abuse of power, but also to highlight appropriate use. As we are unbound by technological restrictions, we can aim to record every single time power is applied so that we may analyze global trends and provide a record for future historians.\n\nPolice, corporate executives, judges, lawyers, private security agents, lobbyists, bankers, principals and politicians: be mindful! We are watching! \n\n\nCop Recorder is Free and Open Source Software. More information is available at OpenWatch.net\n\nWarning: Use of this program is subject to local laws and regulations. The author is not responsible for any unauthorized use of this program." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)donateButtonPressed:(id)sender
{
    
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
