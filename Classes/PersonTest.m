//
//  PersonTest.m
//  ImmuniseThis
//
//  Created by Simon on 04/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "PersonTest.h"


@implementation PersonTest

- (void) setUp {
	// nothing to do
}

- (void) tearDown {
	if (fixture != nil) {
		// [fixture release];
	}
}

- (void) testInitWithName {
	fixture = [[Person alloc] initWithName:@"Player name"];
	STAssertTrue([[fixture name] isEqualToString:@"Player name"], @"Name property inconsistency");
	STAssertTrue([fixture identifier] >= 0, @"Identifier property inconsistency");
}

- (void) testInitWithNameAndIdentifier; {
	fixture = [[Person alloc] initWithName:@"Player name" identifier:123];
	STAssertTrue([[fixture name] isEqualToString:@"Player name"], @"Name property inconsistency");
	STAssertTrue([fixture identifier] == 123, @"Owner property inconsistency");
}

- (void) testInit {
	BOOL caught = NO;
	@try {
		fixture = [[Person alloc] init];
	}
	@catch (NSException * anException) {
		caught = YES;
	}
	if (!caught) {
		STFail(@"Exception expected not thrown");
	}
}

- (void)testIsEqual {
	fixture = [[Person alloc] initWithName:@"Player name" identifier:123];
	Person *person = [[Person alloc] initWithName:@"Another player name" identifier:123];
	STAssertFalse([fixture isEqual:person], @"Person equals comparison inconsistency");
	[person release];
	person = [[Person alloc] initWithName:@"Player name" identifier:1234];
	STAssertFalse([fixture isEqual:person], @"Person equals comparison inconsistency");
	[person release];		
	person = [[Person alloc] initWithName:@"Player name" identifier:123];
	STAssertTrue([fixture isEqual:person], @"Person equals comparison inconsistency");
	STAssertTrue([fixture hash] == [person hash], @"Person hash comparison inconsistency");
	[person release];
	person = [[Person alloc] initWithName:@"Player name" identifier:[fixture identifier]];
	STAssertTrue([fixture isEqual:person], @"Person equals comparison inconsistency");
	STAssertTrue([fixture hash] == [person hash], @"Person hash comparison inconsistency");
	[person release];
}

@end
