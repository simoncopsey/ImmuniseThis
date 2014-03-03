//
//  Runnable.m
//  ImmuniseThis
//
//  Created by Simon on 23/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Runnable.h"


@implementation Runnable

@synthesize stop;

- (void) run {
	[NSException raise:NSInternalInconsistencyException format:@"Run method must be overriden"];
}

- (void) dealloc {
	[pool release];
	[super dealloc];
}

@end