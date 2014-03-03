//
//  VectorTest.m
//  ImmuniseThis
//
//  Created by Simon on 17/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "VectorTest.h"


@implementation VectorTest

- (void) setUp {
}

- (void) tearDown {
	if (fixture != nil) {
		[fixture release];
	}
}

- (void)testIsEqual {
	fixture = [[Vector alloc] initWithX:1 y:2];
	Vector *vector = [[Vector alloc] initWithX:2 y:3];
	STAssertFalse([fixture isEqual:vector], @"Vector equals comparison inconsistency");
	[vector release];
	vector = [[Vector alloc] initWithX:1 y:2];
	STAssertTrue([fixture isEqual:vector], @"Vector equals comparison inconsistency");
	STAssertTrue([fixture hash] == [vector hash], @"Vector hash comparison inconsistency");
	[vector release];
}

- (void) testCopyWithZone {
	fixture = [[Vector alloc] initWithX:1 y:2];
	Vector *vectorCopy = [[fixture copyWithZone:nil] autorelease];
	STAssertFalse(fixture == vectorCopy, @"Vector copy inconsistency");
	STAssertEquals([fixture x], [vectorCopy x], @"Vector copy inconsistency");
	STAssertEquals([fixture y], [vectorCopy y], @"Vector copy inconsistency");
}

- (void) testDistanceTo {
	fixture = [[Vector alloc] initWithX:1 y:1];
	Vector *vector = [[Vector alloc] initWithX:1 y:4];	
	STAssertTrue([fixture distanceTo:vector] == 3.0, @"Vector distance calculation inconsistency");
	[vector release];
	vector = [[Vector alloc] initWithX:1 y:1];	
	STAssertTrue([fixture distanceTo:vector] == 0.0, @"Vector distance calculation inconsistency");
	[vector release];
	vector = [[Vector alloc] initWithX:5 y:1];	
	STAssertTrue([fixture distanceTo:vector] == 4.0, @"Vector distance calculation inconsistency");
	[vector release];
	vector = [[Vector alloc] initWithX:3 y:2];
	STAssertTrue([fixture distanceTo:vector] == sqrt(5.0), @"Vector distance calculation inconsistency");
	[vector release];	
}

- (void) testAngleToInRadians {
	fixture = [[Vector alloc] initWithX:1 y:1];
	Vector *vector = [[Vector alloc] initWithX:2 y:2];
	double angle = [fixture angleToInRadians:vector];
	STAssertTrue(angle == (M_PI / 4), @"Vector angle calculation inconsistency");
	[vector release];
	vector = [[Vector alloc] initWithX:1 y:1];
	BOOL caught = NO;
	@try {
		angle = [fixture angleToInRadians:vector];
	}
	@catch (NSException * anException) {
		caught = YES;
	}
	if (!caught) {
		STFail(@"Exception expected not thrown");
	}
	[vector release];	
}

- (void) testAngleToInDegrees {
	fixture = [[Vector alloc] initWithX:1 y:1];
	Vector *vector = [[Vector alloc] initWithX:2 y:2];
	double angle = [fixture angleToInDegrees:vector];
	STAssertTrue(round(angle) == 45.0, @"Vector angle calculation inconsistency");
	[vector release];
	vector = [[Vector alloc] init];
	angle = [fixture angleToInDegrees:vector];
	STAssertTrue(round(angle) == -135.0, @"Vector angle calculation inconsistency");
	[vector release];
}


@end