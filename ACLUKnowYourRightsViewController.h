//
//  ACLUKnowYourRights.h
//  CopRecorder
//
//  Created by David Chiles on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACLUKnowYourRightsViewController : UIViewController <UIWebViewDelegate>
{
    NSDictionary * webViewInfo;
}




@property (nonatomic,strong) UISegmentedControl * pageControl;
@property (nonatomic,strong) UIWebView * webView;


@end
