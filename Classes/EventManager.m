//
//  CollisionManager.m
//  ImmuniseThis
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//
// DESIGN PATTERN: Observer/Hollywood

#import "EventManager.h"


@implementation EventManager

- (id) initWithArena: (Arena *)anArena {
	if (self = [super init]) {
		observers = [[NSMutableArray alloc] init];
		arena = [anArena retain];
	} return self;	
}

// TODO: allow specification of interest to reduce load, e.g.: withInterest: (Token *)aToken
- (void) registerObserver: (id <EventHandler>)anObserver {
	if (anObserver != nil) {
		[observers addObject:anObserver];
	}
}

- (void) removeObserverIdenticalTo: (id <EventHandler>)anObserver {
	if (anObserver != nil) {
		[observers removeObjectIdenticalTo:anObserver];
	}
}

- (void) removeAllObservers {
	[observers removeAllObjects];
}

- (void) notifyObserversOfEvent: (Event)aSubject token:(Token *)aToken {
	for (id <EventHandler> observer in observers) {
		[observer eventWithSubject:aSubject token:aToken];
	}	
}

- (void) dealloc {
	[self removeAllObservers];
	[observers release];
	[arena release];
	[super dealloc];
}

@end