//
//  ACLUKnowYourRights.m
//  CopRecorder
//
//  Created by David Chiles on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ACLUKnowYourRightsViewController.h"

@interface ACLUKnowYourRightsViewController ()

@end

@implementation ACLUKnowYourRightsViewController

@synthesize pageControl,webView;

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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.title = @"Know Your Rights";
    
    
    
    
    pageControl = [self createSegmentedControl];
    pageControl.selectedSegmentIndex = 0;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:pageControl];
    
    UIBarItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
    //UIBarButtonItem * test = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:nil action:nil];
    
    self.toolbarItems = [NSArray arrayWithObjects:spaceItem,item,spaceItem,nil];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
    webView.delegate = self;
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    webView.backgroundColor = [UIColor colorWithRed:0.452681 green:0.529382 blue:0.691022 alpha:1];
    self.view.backgroundColor = [UIColor colorWithRed:0.452681 green:0.529382 blue:0.691022 alpha:1];
    for(UIView *wview in [[[webView subviews] objectAtIndex:0] subviews]) { 
        if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; } 
    }   
    
    [self switchWebView];
    [self.view addSubview:webView];
    [self.navigationController setToolbarHidden:NO animated:YES];
    
}

- (UISegmentedControl *) createSegmentedControl
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"knowYourRights" ofType:@"plist"];
    webViewInfo = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    UISegmentedControl * segmentedControl = [[UISegmentedControl alloc] initWithItems:[webViewInfo allKeys]];
    segmentedControl.frame = CGRectMake(0, 0, 300, 30);
    //segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    
    //segmentedControl.center = CGPointMake(self.view.center.x, );
    
    
    [segmentedControl addTarget:self
                         action:@selector(segmentPicked:)
               forControlEvents:UIControlEventValueChanged];
    
    return segmentedControl;
    
}

-(void)segmentPicked:(id)sender
{
    [self switchWebView];
}

-(void)switchWebView
{
    NSString * title = [pageControl titleForSegmentAtIndex: [pageControl selectedSegmentIndex]];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: [webViewInfo objectForKey:title] ofType:@"html"]isDirectory:NO]]];

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
-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setToolbarHidden:YES animated:YES];
    //[self.navigationController setToolbarHidden:YEs animated:animated];
}
/////UIWebView Delegate Methods

-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
    if ( inType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication] openURL:[inRequest URL]];
        return NO;
    }
    
    return YES;
}

@end
