//
//  ACLUConfirmUpload.h
//  CopRecorder
//
//  Created by David Chiles on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ACLUConfirmUploadDelegate
@optional
- (void)uploadPressed;
// ... other methods here
@end

@interface ACLUConfirmUpload : UIViewController

@property (nonatomic,strong) id <ACLUConfirmUploadDelegate>delegate;

- (IBAction)yesButtonPressed:(id)sender;
- (IBAction)contactButtonPressed:(id)sender;



@end
