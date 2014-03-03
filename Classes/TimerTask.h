//
//  TimerTask.h
//  ImmuniseThis
//
//	Represents an abstract task that may be controlled by a Timer. Must be extended.
//
//  Created by Simon on 03/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "State.h"

@interface TimerTask : NSObject {
	@protected
	NSTimer *timer;
	float interval;
	State state;
}

/* state of TimerTask (i.e.: new, running, paused, stopped.) a la Thread state */
@property (readonly) State state;

/* start the TimerTask into a Running mode */
- (void) startWithInterval: (float)anInterval;
/* main run method, to be overridden */
- (void) run;
/* pauses execution */
- (void) pause;
/* resumes execution after pausing */
- (void) resume;
/* stops execution */
- (void) stop;

@end