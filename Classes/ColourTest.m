//
//  ColourTest.m
//  ImmuniseThis
//
//  Created by Simon on 23/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ColourTest.h"


@implementation ColourTest

- (void) setUp {
}

- (void) tearDown {
	if (fixture != nil) {
		[fixture release];
	}
}

- (void) testInitWithRedGreenBlue {
	fixture = [[Colour alloc] initWithAlpha:10.0 red:20.0 green:30.0 blue:40.0];
	STAssertTrue([fixture alpha] == 10.0, @"Alpha property inconsistency");
	STAssertTrue([fixture red] == 20.0, @"Red property inconsistency");
	STAssertTrue([fixture green] == 30.0, @"Green property inconsistency");
	STAssertTrue([fixture blue] == 40.0, @"Blue property inconsistency");
}

- (void) testEquals {
	fixture = [[Colour alloc] initWithAlpha:10.0 red:20.0 green:30.0 blue:40.0];
	Colour *colour = [[Colour alloc] initWithAlpha:11.0 red:20.0 green:30.0 blue:40.0];
	STAssertFalse([fixture isEqual:colour], @"Colour equals inconsistency");
	[colour release];
	colour = [[Colour alloc] initWithAlpha:10.0 red:20.0 green:30.0 blue:40.0];
	STAssertTrue([fixture isEqual:colour], @"Colour equals inconsistency");
	STAssertTrue([fixture hash] == [colour hash], @"Colour hash inconsistency");
}

@end
