//
//  ImmuniseThisAppDelegate.m
//  ImmuniseThis
//
//  Created by Simon on 15/02/2010.
//  Copyright Simon Copsey 2010. All rights reserved.
//

#import "ImmuniseThisAppDelegate.h"
#import "ImmuniseThisViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation ImmuniseThisAppDelegate

@synthesize window;
@synthesize viewController;


- (void) applicationDidFinishLaunching:(UIApplication *)application {
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	MPMusicPlayerController *myPlayer = [MPMusicPlayerController applicationMusicPlayer];
	[myPlayer setQueueWithQuery: [MPMediaQuery songsQuery]];
	[myPlayer play];	
}

- (void) dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end