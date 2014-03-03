//
//  InteractionEvent.m
//  ImmuniseThis
//
//  Created by Simon on 17/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "InteractionEvent.h"


@implementation InteractionEvent

@synthesize touchDownLocation;
@synthesize touchUpLocation;
@synthesize touchDistance;
@synthesize touchDirectionInRadians;
@synthesize isSingleTap;

- (id) init {
	if (self = [super init]) {
		[self initWithTouchDownLocation:[[Vector alloc] init] touchUpLocation:[[Vector alloc] init]];
	} return self;
}

// if singleTap, should ignore touchDirectionInRadians!
- (id) initWithTouchDownLocation: (Vector *)aTouchDownLocation touchUpLocation: (Vector *)aTouchUpLocation {
	if (aTouchDownLocation == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aTouchDownLocation may not be nil"];
	}
	if (aTouchUpLocation == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aTouchUpLocation may not be nil"];
	}	
	if (self = [super init]) {
		touchDownLocation = [aTouchDownLocation copyWithZone:nil];
		touchUpLocation = [aTouchUpLocation copyWithZone:nil];
		touchDistance = [aTouchDownLocation distanceTo:aTouchUpLocation];
		isSingleTap = NO;
		@try {
			touchDirectionInRadians = [aTouchDownLocation angleToInRadians:aTouchUpLocation];
		}
		@catch (NSException * e) {
			touchDirectionInRadians = 0;
			isSingleTap = YES;
		}
	} return self;
}

- (void) dealloc {
	[touchDownLocation release];
	[touchUpLocation release];
	[super dealloc];
}

@end
