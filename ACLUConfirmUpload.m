//
//  ACLUConfirmUpload.m
//  CopRecorder
//
//  Created by David Chiles on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ACLUConfirmUpload.h"
#import "ConfirmUploadInfoViewController.h"

@interface ACLUConfirmUpload ()

@end

@implementation ACLUConfirmUpload

@synthesize delegate;

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
    self.navigationItem.title = @"Confirm Upload";
    
    UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(infoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *modalButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    [self.navigationItem setRightBarButtonItem:modalButton animated:YES];
    
    
    UIBarButtonItem * cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
    [self.navigationItem setLeftBarButtonItem:cancelButton animated:YES];
    
}

- (IBAction)yesButtonPressed:(id)sender
{
    if(delegate)
        [delegate uploadPressed];
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (IBAction)contactButtonPressed:(id)sender
{
    
    
}

- (void)infoButtonPressed:(id)sender
{
    ConfirmUploadInfoViewController * infoViewController = [[ConfirmUploadInfoViewController alloc] init];
    [self.navigationController pushViewController:infoViewController animated:YES];
    
}

-(void)cancelButtonPressed:(id)sender
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
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
