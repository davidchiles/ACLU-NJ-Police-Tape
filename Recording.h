//
//  Recording.h
//  CopRecorder
//
//  Created by Christopher Ballinger on 6/9/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recording : NSObject 
{
    NSString *name;
    NSString *publicDescription;
    NSString *privateDescription;
    NSString *location;
    NSDate *date;
    BOOL isSubmitted;
    NSURL *url;
} 


@property (nonatomic) NSString *name;
@property (nonatomic) NSString *publicDescription;
@property (nonatomic) NSString *privateDescription;
@property (nonatomic) NSString *location;
@property (nonatomic) NSDate *date;
@property (nonatomic) NSURL *url;
@property BOOL isSubmitted;

+ (id)recordingWithName:(NSString*)name publicDescription:(NSString*)publicDescription privateDescription:(NSString*)privateDescription location:(NSString*)location date:(NSDate*)date url:(NSURL*)url;
+ (id)recordingWithFile:(NSString*)fileName;

- (void)saveMetadata;
- (void)deleteFiles;
- (void)submitRecordingWithDelegate:(id)delegate;

@end
