//
//  ComputerCellController.m
//  ImmuniseThis
//
//  Created by Simon on 15/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ComputerCellController.h"


@implementation ComputerCellController

- (id) initWithModel: (Cell *)aModel arena: (Arena *)anArena {
	if (self = [super initWithModel:aModel arena:anArena configuration:nil]) {
		// nothing to do
	} return self;	
}


- (id) initWithModel: (Cell *)aModel arena: (Arena *)anArena configuration: (CellConfiguration *)aCellConfiguration {
	if (self = [super initWithModel:aModel arena:anArena configuration:aCellConfiguration]) {
		 // nothing to do
	} return self;
}

- (void) run {
	Cell *cell = [[arena getModelsOfCellWithTeam:kFriendly] lastObject];
	if (cell != nil) {
		CellView *playerCellView = [[arena getViewOfCellWithModel:cell] retain];
		if (playerCellView != nil && ![[cellView location] isEqual:[playerCellView location]]) {
			[cellView setMovement:[[Movement alloc] initWithDirection:[[cellView location] angleToInRadians:[playerCellView location]] speed:[model movementPerTick]]];
			[playerCellView release];
			Vector *newCellLocation = [[cellView movement] calculateNewLocationAndMovementWithOrigin:[cellView location] radius:[cellView radius] arena:arena];
			[cellView setLocation: newCellLocation];
			[projectileDispenser dispenseProjectileAt:newCellLocation];
			[newCellLocation release];

			Vector *newTextLocation = [[[Vector alloc] initWithX:([[cellView location] x] + ([cellView radius] * 2) + 30) y:[[cellView location] y]] autorelease];
			[textView setLocation: newTextLocation];
			NSString *description = [[[model name] stringByAppendingString:[NSString stringWithFormat:@" %d", [model health]]] retain];
			[textView setString: description];
			[description release];
			[cellView setNeedsDisplay];
		}
	}
	[cell release];
}

- (void) collisionOfToken: (Token *)aFirstToken withToken: (Token *)aSecondToken {
	if (([aFirstToken isKindOfClass:[Cell class]] && [aFirstToken isEqual:model]
		 && [aSecondToken team] != [model team] && [aSecondToken isKindOfClass:[Projectile class]])) {
		if ((lastProjectileHit == nil || ![lastProjectileHit isEqual:aFirstToken])) {
			[model setHealth:[model health] - [aSecondToken health]];
			lastProjectileHit = [(Projectile *) aSecondToken retain];
			if ([model health] <= 0) {
				[cellView setVisibility:kHidden];
				[textView setVisibility:kHidden];
				[[arena eventManager] notifyObserversOfEvent:kHealthDepleted token:model];
			}
		}
	}	
}

- (void) collisionWithArenaBoundsOfToken:(Token *)aToken {
	// nothing to do.
}

- (void) dealloc {
	[super dealloc];
}

@end