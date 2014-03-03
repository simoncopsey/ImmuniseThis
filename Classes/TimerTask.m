//
//  TimerTask.m
//  ImmuniseThis
//
//  Created by Simon on 03/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "TimerTask.h"


@implementation TimerTask

- (void) startWithInterval: (float)anInterval {
	interval = anInterval;
	timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(run) userInfo:nil repeats:YES];
	state = kRunning;
}

@synthesize state;

- (void) run {
	[NSException raise:NSInternalInconsistencyException format:@"run method must be overriden"];
}

- (void) pause {
	@synchronized(self) {
		if (state != kRunning) {
			[NSException raise:NSInternalInconsistencyException format:@"May only pause a running TimerTask"];
		}
		[timer invalidate];
		state = kPaused;
	}
}

// NOTE: does not carry across state of previous timer.
- (void) resume {
	@synchronized(self) {
		if (state != kPaused) {
			[NSException raise:NSInternalInconsistencyException format:@"May only resume a paused TimerTask"];
		}
		timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(run) userInfo:nil repeats:YES];
		state = kRunning;
	}
}

- (void) stop {
	@synchronized(self) {
		if (state != kRunning || state != kPaused) {
			[NSException raise:NSInternalInconsistencyException format:@"May only stop a running or paused TimerTask"];
		}
		state = kStopped;
	}
	[timer invalidate];
}

- (void) dealloc {
	[timer release];
	[super dealloc];
}

@end
