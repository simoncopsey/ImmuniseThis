//
//  ComputerCellFactory.m
//  ImmuniseThis
//
//  Created by Simon on 19/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//


#import "ComputerCellFactory.h"
#import "ComputerCellController.h" // TODO: move imports into implementation files.


@implementation ComputerCellFactory

- (id) initWithArena:(Arena *)anArena {
	if (anArena == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anArena must not be nil"];
	}
	if (self = [super init]) {
		arena = [anArena retain];
		cellModelsToControllers = [[NSMutableDictionary alloc] init];
		nextHealth = 5;
		nextRadius = 30;
		[[arena eventManager] registerObserver:self];
	} return self;
}

- (void) eventWithSubject: (Event)anEvent token:(Token *)aToken {
	if (anEvent == kHealthDepleted && [aToken isKindOfClass:[Cell class]] && [aToken team] == kEnemy) {
		ComputerCellController *computerController = [cellModelsToControllers objectForKey:aToken];
		if (computerController != nil) {
			nextHealth += 5;
			if (nextRadius > 15) {
				nextRadius -= 10;
			}
			[[computerController model] setHealth: nextHealth];
			[[computerController cellView] setRadius:nextRadius];
// 			Organelle *computerFlagella = [[Organelle alloc] initWithName:@"Flagella" description:@"A Flagella, lending motility" health:0 healthRegenerationPerTick:0 movementPerTick:2 projectileMaximum:0 projectileHealth:0];
//			[[computerController model] addOrganelle:[computerFlagella autorelease]];
			[[computerController cellView] setLocation:[[Vector alloc] initWithX:40 + (arc4random() % 240) y:40 + (arc4random() % 400)]];
			[[computerController cellView] setVisibility:kVisible];
			[[computerController textView] setVisibility:kVisible];
		}
	}
}

- (ComputerCellController *) getComputerCell {
	Cell *computerModel = [[Cell alloc] initWithName:@"Computer" description:@"Description" owner:[[Person alloc] initWithName:@"Computer"] health:nextHealth team:kEnemy];
	Organelle *computerFlagella = [[Organelle alloc] initWithName:@"Flagella" description:@"A Flagella, lending motility" health:0 healthRegenerationPerTick:0 movementPerTick:2 projectileMaximum:0 projectileHealth:0];
	[computerModel addOrganelle:[computerFlagella autorelease]];
	Organelle *computerProjectileDispenser = [[Organelle alloc] initWithName:@"Projectile Dispenser" description:@"Dispenses projectiles" health:0 healthRegenerationPerTick:0 movementPerTick:0 projectileMaximum:5 projectileHealth:10];
	[computerModel addOrganelle:[computerProjectileDispenser autorelease]];
	CellConfiguration *computerCellConfiguration = [[CellConfiguration alloc] initWithColour:[Colour redColour] centre:[[[Vector alloc] initWithX:40 + (arc4random() % 240) y:40 + (arc4random() % 400)] autorelease] radius:nextRadius];
	ComputerCellController *computerController = [[ComputerCellController alloc] initWithModel:computerModel arena:arena configuration:computerCellConfiguration];
	[computerCellConfiguration release];
	[cellModelsToControllers setObject:computerController forKey:computerModel];
	return computerController;
}

- (void) dealloc {
	[arena release];
	[cellModelsToControllers release];
	[super dealloc];
}

@end