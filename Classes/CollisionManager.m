//
//  CollisionManager.m
//  ImmuniseThis
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//
// DESIGN PATTERN: Observer/Hollywood

#import "CollisionManager.h"


@implementation CollisionManager

- (id) initWithArena: (Arena *)anArena {
	if (self = [super init]) {
		observers = [[NSMutableArray alloc] init];
		arena = [anArena retain];
	} return self;	
}

// TODO: allow specification of interest to reduce load, e.g.: withInterest: (Token *)aToken
- (void) registerObserver: (id <CollisionHandler>)anObserver {
	if (anObserver != nil) {
		[observers addObject:anObserver];
	}
}

- (void) removeObserverIdenticalTo: (id <CollisionHandler>)anObserver {
	if (anObserver != nil) {
		[observers removeObjectIdenticalTo:anObserver];
	}
}

- (void) removeAllObservers {
	[observers removeAllObjects];
}

// TODO: pause collision detection whilst on main menu?
// TODO: more efficient way of doing this?
// TODO: only manages collisions of cells with other cells or projectiles.
// TODO: will throw two events for one collision (CellA-CellB) and (CellB-CellA) - SoundManager is taking advantage of this assumption.
- (void) run {
	for (Cell *firstCell in [arena cells]) {
		CellView *firstCellView = [[arena getViewOfCellWithModel:firstCell] retain];
		// if ([firstCellView visibility] == kVisible) {
			Vector *firstCellLocation = [[firstCellView location] retain];
			NSInteger firstCellRadius = [firstCellView radius];
			for (Cell *secondCell in [arena cells]) {
				if (firstCell != secondCell) {
					CellView *secondCellView = [[arena getViewOfCellWithModel:secondCell] retain];
					if ([secondCellView visibility] == kVisible) {
						NSInteger secondCellRadius = [secondCellView radius];
						Vector *secondCellLocation = [[secondCellView location] retain];
						// TODO: approximate: width != radius!
						if ([[firstCellView location] distanceTo:secondCellLocation] < (firstCellRadius + secondCellRadius)) {
							[self notifyObserversOfCollisionOfToken:firstCell withToken:secondCell];
						}
						[secondCellLocation release];
					}
					[secondCellView release];
				}
			}
			for (Projectile *projectile in [arena projectiles]) {
				ProjectileView *projectileView = [[arena getViewOfProjectileWithModel:projectile] retain];
				if ([projectileView visibility] == kVisible) {
					// TODO: Assuming width == height
					NSInteger projectileWidth = [projectileView width];
					Vector *projectileLocation = [[projectileView location] retain];
					// TODO: approximate: width != radius!
					if ([[firstCellView location] distanceTo:projectileLocation] < (firstCellRadius + projectileWidth)) {
						[self notifyObserversOfCollisionOfToken:firstCell withToken:projectile];
					}
					[projectileLocation release];
				}
				[projectileView release];
			}
			[firstCellLocation release];
		//}
		[firstCellView release];
	}
}


- (void) notifyObserversOfCollisionOfToken: (Token *)aFirstToken withToken:(Token *)aSecondToken {
	for (id <CollisionHandler> observer in observers) {
		[observer collisionOfToken:aFirstToken withToken:aSecondToken];
	}	
}

- (void) notifyObserversOfCollisionWithArenaEdgeOfToken: (Token *)aToken {
	for (id <CollisionHandler> observer in observers) {
		[observer collisionWithArenaBoundsOfToken:aToken];
	}	
}

- (void) dealloc {
	[self removeAllObservers];
	[observers release];
	[arena release];
	[super dealloc];
}

@end