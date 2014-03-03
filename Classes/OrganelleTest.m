//
//  OrganelleTest.m
//  ImmuniseThis
//
//  Created by Simon on 04/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "OrganelleTest.h"


@implementation OrganelleTest

- (void) setUp {
	// nothing to do
}

- (void) tearDown {
	if (fixture != nil) {
		[fixture release];
	}
}

- (void) testInitWithName {
	fixture = [[Organelle alloc] initWithName:@"Organelle name" description:@"Organelle description" health:10 healthRegenerationPerTick:5 movementPerTick:4 projectileMaximum:4 projectileHealth:1];
	STAssertTrue([[fixture name] isEqualToString:@"Organelle name"], @"Name property inconsistency");
	STAssertTrue([[fixture description] isEqualToString:@"Organelle description"], @"Description property inconsistency");
	STAssertTrue([fixture health] == 10, @"Health property inconsistency");
	STAssertTrue([fixture healthRegenerationPerTick] == 5, @"Health Regeneration Per Tick property inconsistency");
	STAssertTrue([fixture movementPerTick] == 4, @"Movement Per Tick property inconsistency");
	STAssertTrue([fixture projectileMaximum] == 4, @"Projectile Maximum property inconsistency");
	STAssertTrue([fixture projectileHealth] == 1, @"Projectile Health property inconsistency");
	
	fixture = [[Organelle alloc] initWithName:@"Organelle name" description:nil health:5 healthRegenerationPerTick:4 movementPerTick:3 projectileMaximum:2 projectileHealth:3];
	STAssertTrue([[fixture name] isEqualToString:@"Organelle name"], @"Name property inconsistency");
	STAssertTrue([fixture description] == nil, @"Description property inconsistency");
	STAssertTrue([fixture health] == 5, @"Health property inconsistency");
	STAssertTrue([fixture healthRegenerationPerTick] == 4, @"Health Regeneration Per Tick property inconsistency");
	STAssertTrue([fixture movementPerTick] == 3, @"Movement Per Tick property inconsistency");
	STAssertTrue([fixture projectileMaximum] == 2, @"Projectile Maximum property inconsistency");
	STAssertTrue([fixture projectileHealth] == 3, @"Projectile Health property inconsistency");
}

- (void) testInit; {
	fixture = [[Organelle alloc] init];
	STAssertTrue([fixture name] == nil, @"Organelle property inconsistency");
}

/*
- (void)testIsEqual {
	fixture = [[Organelle alloc] initWithName:@"Organelle name" description:@"Organelle description" health:10 healthRegenerationPerTick:5 movementPerTick:4 projectileDamagePerTick:3];
	Organelle *organelle = [[Organelle alloc] initWithName:@"Organelle name" description:@"Organelle description" health:1 healthRegenerationPerTick:5 movementPerTick:4 projectileDamagePerTick:3];
	STAssertFalse([fixture isEqual:organelle], @"Organelle equals comparison inconsistency");
	[organelle release];
	organelle = [[Organelle alloc] initWithName:@"Organelle name" description:@"Organelle description" health:10 healthRegenerationPerTick:5 movementPerTick:4 projectileDamagePerTick:3];
	STAssertTrue([fixture isEqual:organelle], @"Organelle equals comparison inconsistency");
	STAssertTrue([fixture hash] == [organelle hash], @"Organelle hash comparison inconsistency");
	[organelle release];
}
 */

@end