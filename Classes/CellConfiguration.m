//
//  CellConfiguration.m
//  ImmuniseThis
//
//  Created by Simon on 09/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "CellConfiguration.h"


@implementation CellConfiguration

@synthesize colour;
@synthesize location;
@synthesize radius;

- (id) init {
	if (self = [super init]) {
		[self initWithColour:[Colour redColour] centre:[[Vector alloc] init] radius:10];
	} return self;
}

- (id) initWithColour: (Colour *)aColour centre: (Vector *)aLocation radius: (NSInteger)aRadius {
	if (aColour == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aColour may not be nil"];
	}
	if (aLocation == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aLocation may not be nil"];
	}
	if (aRadius <= 0.0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aRadius must be greater than 0"];
	}	
	if (self = [super init]) {
		colour = [aColour copyWithZone:nil];
		location = [aLocation copyWithZone:nil];
		radius = aRadius;
	} return self;
}

- (void) dealloc {
	[colour release];
	[location release];
	[super dealloc];
}

@end
