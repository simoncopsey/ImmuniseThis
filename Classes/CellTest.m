//
//  CellTest.m
//  ImmuniseThis
//
//  Created by Simon on 03/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "CellTest.h"

@implementation CellTest

- (void) setUp {
	// nothing to do
}

- (void) tearDown {
	if (fixture != nil) {
		[fixture release];
	}
}

- (void) testInitWithName {
	fixture = [[Cell alloc] initWithName:@"AnimalCell name" description:@"AnimalCell Description" owner:nil health:15 team:kFriendly];
	STAssertTrue([[fixture name] isEqualToString:@"AnimalCell name"], @"Name property inconsistency");
	STAssertTrue([[fixture description] isEqualToString:@"AnimalCell Description"], @"Description property inconsistency");
	STAssertTrue([fixture owner] == nil, @"Owner property inconsistency");
	STAssertTrue([fixture health] == 15, @"Health property inconsistency");
}

- (void) testInit {
	BOOL caught = NO;
	@try {
		fixture = [[Cell alloc] init];
	}
	@catch (NSException * anException) {
		caught = YES;
	}
	if (!caught) {
		STFail(@"Exception expected not thrown");
	}
}

- (void) testOrganelleCount {
	fixture = [[Cell alloc] initWithName:@"AnimalCell name" description:@"AnimalCell Description" owner:nil health:15 team:kFriendly];
	STAssertTrue([fixture organelleCount] == 0, @"Organelle count inconsistency");
	[fixture addOrganelle: [[Organelle alloc] init]];
	STAssertTrue([fixture organelleCount] == 1, @"Organelle count inconsistency");
}

- (void) testOrganelleAtIndex {
	fixture = [[Cell alloc] initWithName:@"AnimalCell name" description:@"AnimalCell Description" owner:nil health:15 team:kFriendly];
	Organelle *organelle = [[Organelle alloc] init];
	Organelle *organelle2 = [[Organelle alloc] init];
	[fixture addOrganelle: organelle];
	[fixture addOrganelle: organelle2];
	STAssertTrue([fixture organelleCount] == 2, @"Organelle count inconsistency");
	STAssertTrue([fixture organelleAtIndex:0] == organelle , @"Organelle retrieval by index inconsistency");
	STAssertTrue([fixture organelleAtIndex:1] == organelle2 , @"Organelle retrieval by index inconsistency");
	STAssertTrue([fixture organelleAtIndex:2] == nil , @"Organelle retrieval by index inconsistency");
}

- (void) testRemoveOrganelle {
	fixture = [[Cell alloc] initWithName:@"AnimalCell name" description:@"AnimalCell Description" owner:nil health:15 team:kFriendly];
	Organelle *organelle = [[Organelle alloc] init];
	Organelle *organelle2 = [[Organelle alloc] init];
	[fixture addOrganelle: organelle];
	[fixture addOrganelle: organelle2];
	STAssertTrue([fixture organelleCount] == 2, @"Organelle count inconsistency");
	[fixture removeOrganelleIdenticalTo: nil ];
	STAssertTrue([fixture organelleCount] == 2, @"Organelle count inconsistency");
	[fixture removeOrganelleIdenticalTo: organelle];
	STAssertTrue([fixture organelleCount] == 1, @"Organelle removal inconsistency");
	[fixture removeOrganelleIdenticalTo: organelle];
	STAssertTrue([fixture organelleCount] == 1, @"Organelle removal inconsistency");
	[fixture removeOrganelleIdenticalTo: organelle2];
	STAssertTrue([fixture organelleCount] == 0, @"Organelle removal inconsistency");
}

- (void) testRemoveOrganelleAtIndex {
	fixture = [[Cell alloc] initWithName:@"AnimalCell name" description:@"AnimalCell Description" owner:nil health:15 team:kFriendly];
	Organelle *organelle = [[Organelle alloc] init];
	Organelle *organelle2 = [[Organelle alloc] init];
	[fixture addOrganelle: organelle];
	[fixture addOrganelle: organelle2];
	STAssertTrue([fixture removeOrganelleAtIndex:1] == organelle2 , @"Organelle removal by index inconsistency");
	STAssertTrue([fixture removeOrganelleAtIndex:0] == organelle , @"Organelle removal by index inconsistency");
	STAssertTrue([fixture removeOrganelleAtIndex:0] == nil , @"Organelle removal by index inconsistency");
}

- (void)testIsEqual {
	fixture = [[Cell alloc] initWithName:@"AnimalCell name" description:@"AnimalCell Description" owner:nil health:15 team:kFriendly];
	Cell *cell = [[Cell alloc] initWithName:@"AnimalCell name" description:@"AnimalCell Description" owner:nil health:10 team:kFriendly];
	STAssertTrue([fixture isEqual:cell], @"Cell equals comparison inconsistency (health temporal and should not considered)");
	[cell release];
	cell = [[Cell alloc] initWithName:@"AnimalCell name" description:@"AnimalCell Description" owner:nil health:15 team:kEnemy];
	STAssertFalse([fixture isEqual:cell], @"Cell equals comparison inconsistency");
	STAssertFalse([fixture hash] == [cell hash], @"Cell hash comparison inconsistency");	
	cell = [[Cell alloc] initWithName:@"AnimalCell name" description:@"AnimalCell Description" owner:nil health:15 team:kFriendly];
	STAssertTrue([fixture isEqual:cell], @"Cell equals comparison inconsistency");
	STAssertTrue([fixture hash] == [cell hash], @"Cell hash comparison inconsistency");
	[cell release];
	
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	STAssertTrue([dictionary count] == 0, @"Cell dictionary inconsistency");
	NSString *testObject = @"TestObject";
	[dictionary setObject:testObject forKey:fixture];
	STAssertTrue([dictionary count] == 1, @"Cell dictionary inconsistency");
	STAssertEquals(testObject, [dictionary objectForKey:fixture], @"Cell dictionary inconsistency");
	[dictionary setObject:testObject forKey:fixture];
	STAssertTrue([dictionary count] == 1, @"Cell dictionary inconsistency");
}

@end
