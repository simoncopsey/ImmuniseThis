//
//  CellViewTest.m
//  ImmuniseThis
//
//  Created by Simon on 07/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "CellViewTest.h"


@implementation CellViewTest

- (void) setUp {
	arena = [[Arena alloc] initWithOrigin:[[Vector alloc] init] width:320 height:480 backgroundColour:[Colour blackColour] borderColour:[Colour redColour]];
}

- (void) tearDown {
	[arena release];
}

- (void) testInit {
	// TODO: complete me
}

- (void) testInitWithName {
	// TODO: constructors are inherited!
	Colour *colour = [[[Colour alloc] initWithAlpha:10.0 red:20.0 green:30.0 blue:40.0] retain];
	Vector *location = [[[Vector alloc] initWithX:10 y:10] retain];
	fixture = [[CellView alloc] initWithName:@"Cell name" centre:location arena:arena radius:110 colour:colour health:100];
	STAssertTrue([[fixture name] isEqualToString:@"Cell name"], @"Name property inconsistency");
	STAssertTrue([[fixture location] isEqual:location], @"Cell location property inconsistency");
	STAssertTrue([[fixture colour] isEqual: colour], @"Cell Colour property inconsistency");
	STAssertTrue([fixture radius] == 110, @"Radius property inconsistency");
	STAssertTrue([[fixture movement] direction] == 0.0, @"Direction property inconsistency");
	STAssertTrue([[fixture movement] speed] == 0.0, @"Direction property inconsistency");
	STAssertTrue([fixture maximumHealth] == 100, @"Maximum Health property inconsistency");
	STAssertTrue([fixture currentHealth] == [fixture maximumHealth], @"Current Health property inconsistency");
	
	[fixture release];
	[location release];
	location = [[[Vector alloc] initWithX:10 y:10] retain];
	fixture = [[CellView alloc] initWithName:@"Cell name" origin:location arena:arena radius:10 colour:colour health:100];
	STAssertTrue([[fixture name] isEqualToString:@"Cell name"], @"Name property inconsistency");
	STAssertTrue([[fixture location] isEqual:[[Vector alloc] initWithX:20 y:20]], @"Cell location property inconsistency");
	STAssertTrue([[fixture colour] isEqual: colour], @"Cell Colour property inconsistency");
	STAssertTrue([fixture radius] == 10, @"Radius property inconsistency");
	STAssertTrue([[fixture movement] direction] == 0.0, @"Direction property inconsistency");
	STAssertTrue([[fixture movement] speed] == 0.0, @"Direction property inconsistency");
	STAssertTrue([fixture maximumHealth] == 100, @"Maximum Health property inconsistency");
	STAssertTrue([fixture currentHealth] == [fixture maximumHealth], @"Current Health property inconsistency");

	BOOL caught = NO;
	@try {
		fixture = [[CellView alloc] initWithName:nil centre:location arena:arena radius:110 colour:colour health:100];	
	}
	@catch (NSException * anException) {
		caught = YES;
	}
	if (!caught) {
		STFail(@"Exception expected not thrown");
	}
	[colour release];
	[location release];
}

- (void)testIsEqual {
	Colour *colour = [[[Colour alloc] initWithAlpha:10.0 red:20.0 green:30.0 blue:40.0] retain];
	Vector *location = [[[Vector alloc] initWithX:10 y:10] retain];
	fixture = [[CellView alloc] initWithName:@"Cell name" centre:location arena:arena radius:110 colour:colour health:100];

	Colour *colour2 = [[[Colour alloc] initWithAlpha:10.0 red:20.0 green:30.0 blue:40.0] retain];
	Vector *location2 = [[[Vector alloc] initWithX:10 y:10] retain];
	CellView *cellView2 = [[CellView alloc] initWithName:@"Cell name" centre:location arena:arena radius:110 colour:colour health:10];
	
	STAssertFalse([fixture isEqual:cellView2], @"CellView equals comparison inconsistency");
	[cellView2 release];
	cellView2 = [[CellView alloc] initWithName:@"Cell name" centre:location arena:arena radius:110 colour:colour health:10];
	STAssertFalse([fixture isEqual:cellView2], @"CellView equals comparison inconsistency");
	[cellView2 release];		
	cellView2 = [[CellView alloc] initWithName:@"Cell name" centre:location arena:arena radius:110 colour:colour health:100];
	STAssertTrue([fixture isEqual:cellView2], @"CellView equals comparison inconsistency");
	STAssertTrue([fixture hash] == [cellView2 hash], @"CellView hash comparison inconsistency");
	[cellView2 release];
	cellView2 = [[CellView alloc] initWithName:@"Cell name" centre:location2 arena:arena radius:110 colour:colour2 health:100];
	STAssertTrue([fixture isEqual:cellView2], @"CellView equals comparison inconsistency");
	STAssertTrue([fixture hash] == [cellView2 hash], @"CellView hash comparison inconsistency");
	[cellView2 release];
	cellView2 = nil;
	STAssertFalse([fixture isEqual:cellView2], @"CellView equals comparison inconsistency");
	STAssertFalse([fixture isEqual:@""], @"CellView equals comparison inconsistency");
}

@end
