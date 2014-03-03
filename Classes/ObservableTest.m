//
//  ObservableTest.m
//  ImmuniseThis
//
//  Created by Simon on 06/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ObservableTest.h"


@implementation ObservableTest

- (void) setUp {
	updateCounter = 0;
	fixture = [[Observable alloc] init];
}

- (void) tearDown {
	if (fixture != nil) {
		[fixture removeAllObservers];
		[fixture release];
	}
	[lastEvent release];
}

- (void)testRegisterObserver {
	Event *event = [[Event alloc] init];
	[fixture registerObserver: self];
	STAssertTrue(updateCounter == 0, @"Update counter initialisation inconsistency");
	[fixture notifyObservers: event];
	STAssertTrue(updateCounter == 1, @"Observer registration / notification inconsistency");
	[fixture notifyObservers: event];
	STAssertTrue(updateCounter == 2, @"Observer registration / notification inconsistency");
}

- (void)testRemoveObserver {
	Event *event = [[Event alloc] init];
	[fixture registerObserver: self];
	STAssertTrue(updateCounter == 0, @"Update counter initialisation inconsistency");
	[fixture notifyObservers: event];
	STAssertTrue(updateCounter == 1, @"Observer registration / notification inconsistency");
	[fixture notifyObservers: event];
	STAssertTrue(updateCounter == 2, @"Observer registration / notification inconsistency");
	
}

- (void)testRemoveAllObservers {
	Event *event = [[Event alloc] init];
	Event *event2 = [[Event alloc] init];
	STAssertTrue(updateCounter == 0, @"Update counter initialisation inconsistency");
	[fixture registerObserver: self];
	[fixture notifyObservers: event];
	STAssertTrue(updateCounter == 1, @"Observer registration / notification inconsistency");
	STAssertTrue(lastEvent == event, @"Observer notification inconsistency");
	[fixture removeAllObservers];
	[fixture notifyObservers: event2];
	STAssertTrue(updateCounter == 1, @"Observer registration / notification inconsistency");
	STAssertTrue(lastEvent == event, @"Observer notification inconsistency");
}

- (void)testNotifyObservers {
	Event *event = [[Event alloc] init];
	Event *event2 = [[Event alloc] init];
	STAssertTrue(updateCounter == 0, @"Update counter initialisation inconsistency");
	[fixture notifyObservers: event];
	STAssertTrue(updateCounter == 0, @"Update counter initialisation inconsistency");
	[fixture registerObserver: self];
	[fixture notifyObservers: event];
	STAssertTrue(updateCounter == 1, @"Observer registration / notification inconsistency");
	STAssertTrue(lastEvent == event, @"Observer notification inconsistency");
	STAssertTrue(lastEvent != event2, @"Observer notification inconsistency");
	[fixture notifyObservers: event2];
	STAssertTrue(updateCounter == 2, @"Observer registration / notification inconsistency");
	STAssertTrue(lastEvent != event, @"Observer notification inconsistency");
	STAssertTrue(lastEvent == event2, @"Observer notification inconsistency");
}

- (void) update: (Event *)anEvent {
	updateCounter++;
	lastEvent = anEvent;
}

@end
