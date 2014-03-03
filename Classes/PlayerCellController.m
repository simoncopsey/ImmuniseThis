//
//  PlayerCellController.m
//  ImmuniseThis
//
//  Created by Simon on 07/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "PlayerCellController.h"


@implementation PlayerCellController

- (void) playerTouchWithInteraction: (InteractionEvent *)anInteractionEvent {
	if (anInteractionEvent != nil) {
		if ([[anInteractionEvent touchDownLocation] distanceTo:[cellView location]] < [cellView radius]) {
			double speed = [anInteractionEvent touchDistance] * 0.2;
			speed = MIN(speed, [model movementPerTick]);
			[cellView setMovement: [[Movement alloc] initWithDirection:[anInteractionEvent touchDirectionInRadians] speed:speed]];
		}
	}
}

- (void) run {
	[model setHealth:[model health] + [model healthRegenerationPerTick]];
	Vector *newCellLocation = [[cellView movement] calculateNewLocationAndMovementWithOrigin:[cellView location] radius:[cellView radius] arena:arena];
	[cellView setLocation: newCellLocation];
	[cellView setMovement:[[Movement alloc] initWithDirection:[[cellView movement] direction] speed:MAX([[cellView movement] speed] -1, 0)]];
	// TODO: move this up to superclass?
	[projectileDispenser dispenseProjectileAt:newCellLocation];
	[newCellLocation release];

	Vector *newTextLocation = [[[Vector alloc] initWithX:([[cellView location] x] + ([cellView radius] * 2) + 30) y:[[cellView location] y]] autorelease];
	[textView setLocation: newTextLocation];
	NSString *description = [[[model name] stringByAppendingString:[NSString stringWithFormat:@" %d", [model health]]] retain];
	[textView setString:description];
	[description release];
	[cellView setNeedsDisplay];
}

- (void) collisionOfToken: (Token *)aFirstToken withToken: (Token *)aSecondToken {
	if (([aFirstToken isKindOfClass:[Cell class]] && [aFirstToken isEqual:model]
		 && [aSecondToken team] != [model team] && [aSecondToken isKindOfClass:[Projectile class]])) {
		if ((lastProjectileHit == nil || ![lastProjectileHit isEqual:aSecondToken])) {
			[model setHealth:[model health] - [aSecondToken health]];
			lastProjectileHit = [(Projectile *) aSecondToken retain];
			if ([model health] <= 0) {
				[[arena eventManager] notifyObserversOfEvent:kHealthDepleted token:model];
			}			
		}
	}
}

- (void) collisionWithArenaBoundsOfToken:(Token *)aToken {
	// nothing to do.
}

- (void) dealloc {
	[lastProjectileHit release];
	[super dealloc];
}

@end