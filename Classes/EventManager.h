//
//  EventHandler.h
//  ImmuniseThis
//
//	Handles events by broadcasting events to listeners.
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"
#import "EventHandler.h"

@class Arena; // TODO Temporary fix.

// TODO: singleton
@interface EventManager : NSObject {
	@private
	Arena *arena;
	NSMutableArray *observers;
}

- (id) initWithArena: (Arena *)anArena;
- (void) registerObserver: (id <EventHandler>)anObserver;
- (void) removeObserverIdenticalTo: (id <EventHandler>)anObserver;
- (void) removeAllObservers;
- (void) notifyObserversOfEvent: (Event)aSubject token:(Token *)aToken;

@end