//
//  Movement.m
//  ImmuniseThis
//
//  Created by Simon on 16/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Movement.h"


@implementation Movement

@synthesize direction;
@synthesize speed;

- (id) init {
	if (self = [super init]) {
		[self initWithDirection:0 speed:0];
	} return self;
}

- (id) initWithDirection: (double)aDirection speed: (double)aSpeed {
	if (self = [super init]) {
		hash = 0;
		direction = aDirection;
		speed = aSpeed;
	} return self;
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;
	if (anObject != nil && [anObject isKindOfClass: [Movement class]]) {
		Movement *movement = (Movement *) anObject;
		if ([self direction] == [movement direction] && [self speed] == [movement speed]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	if (hash < 1) {
		NSInteger newHash = 1;
		newHash *= 7 + [self direction];
		newHash *= 7 + [self speed];
		hash = newHash;
	}
	return hash;
}

- (id) copyWithZone:(NSZone *)zone {
	Movement *movement = [[Movement alloc] initWithDirection:direction speed:speed];
	// return [movement autorelease];
	return movement;
}

- (Vector *) calculateNewLocationAndMovementWithOrigin: (Vector *)aLocation {
	return [self calculateNewLocationAndMovementWithOrigin: aLocation radius:0 arena:nil];
}

// TODO: this augments self, unclear - convert to / combine with Vector?
// TODO: relying on width being same as height! Movement only works with circles
- (Vector *) calculateNewLocationAndMovementWithOrigin: (Vector *)aLocation radius:(NSInteger)aRadius arena: (Arena *)anArena {
	double x = ([self speed] * cos([self direction])) + [aLocation x];
	double y = ([self speed] * sin([self direction])) + [aLocation y];
	if (anArena != nil) {
		if ((x + aRadius) >= [anArena width] || (x - aRadius <= 0)) {
			speed = speed * 0.8;
			direction = M_PI - direction;
			// TODO: FIXME: which token?
			[[anArena collisionManager] notifyObserversOfCollisionWithArenaEdgeOfToken:nil];
		} else if ((y + aRadius) >= [anArena height] || (y - aRadius) <= 0) {
			speed = speed * 0.8;
			direction = -direction;
			// TODO: FIXME: which token?
			[[anArena collisionManager] notifyObserversOfCollisionWithArenaEdgeOfToken:nil];
		}
		x = (speed * cos(direction)) + [aLocation x];
		y = (speed * sin(direction)) + [aLocation y];
	}
	return [[Vector alloc] initWithX:x y:y];
}

- (void) dealloc {
	[super dealloc];
}

@end
