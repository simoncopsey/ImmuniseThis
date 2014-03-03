//
//  CollisionManager.h
//  ImmuniseThis
//
//	Handles collisions by broadcasting events to listeners.
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimerTask.h"
#import "Arena.h"
#import "CollisionHandler.h"


@class Arena; // TODO: Temporary fix

@interface CollisionManager : TimerTask {
	@private
	Arena *arena;
	NSMutableArray *observers;
}

/** constructs an instance of the collision manager with the given arena reference **/
- (id) initWithArena: (Arena *)anArena;
/** register an observer whom will receive collision notifications **/
- (void) registerObserver: (id <CollisionHandler>)anObserver;
/** remove a previously-added observer **/
- (void) removeObserverIdenticalTo: (id <CollisionHandler>)anObserver;
/** remove all previously-added observers **/
- (void) removeAllObservers;
/** notify observers of a collision between two tokens **/
- (void) notifyObserversOfCollisionOfToken: (Token *)aFirstToken withToken:(Token *)aSecondToken;
/** notify observers of a collision between a token and the arena bounds **/
- (void) notifyObserversOfCollisionWithArenaEdgeOfToken: (Token *)aToken;

@end