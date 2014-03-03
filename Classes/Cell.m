//
//  Cell.m
//  ImmuniseThis
//
//  Created by Simon on 03/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize name;
@synthesize description;
@synthesize owner;
@synthesize organelles;
@synthesize healthRegenerationPerTick;
@synthesize movementPerTick;
@synthesize projectileMaximum;
@synthesize projectileHealth;

/*
- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
	return nil;
}
*/

- (id) init {
	if (self = [super init]) {
		[self initWithName:nil description:nil owner:nil health:100 team:kFriendly];
	} return self;
}

- (id) initWithName: (NSString *)aName description: (NSString *)aDescription owner: (Person *)anOwner health: (NSInteger)anHealthAmount team: (Team)aTeam {
	if (aName == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aName may not be nil"];
	}
	if (self = [super initWithTeam:aTeam health:anHealthAmount]) {
		name = [[NSString stringWithString:aName] retain];
		description = nil;
		if (aDescription != nil) {
			description = [[NSString stringWithString:aDescription] retain];
		}		
		// Owner is immutable, no need to defensive copy
		owner = [anOwner retain];
		organelles = [[NSMutableArray alloc] init];
		healthRegenerationPerTick = 0;
		movementPerTick = 0;
		projectileMaximum = 0;
		projectileHealth = 0;
	} return self;
}

// TODO: isEqual and hash methods are intensive
// TODO: do I need to compare superclass properties, or is this isEquals called automatically?
- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;
	if (anObject != nil && [anObject isKindOfClass: [Cell class]]) {
		Cell *cell = (Cell *) anObject;
		if ([[self name] isEqual:[cell name]]
			&& [[self description] isEqual:[cell description]] && [self team] == [cell team]
			&& (([self owner] == nil && [cell owner] == nil) || [[self owner] isEqual:[cell owner]])
			&& [[self organelles] isEqualToArray:[cell organelles]]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	NSInteger hash = 1;
	hash *= 7 + [self team];
	hash *= 7 + [[self name] hash];
	hash *= 7 + [[self description] hash];;
	hash *= 7 + [[self owner] hash];
	for (Organelle *organelle in [self organelles]) {
		hash *= 7 + [organelle hash];
	}
	return hash;
}

- (id) copyWithZone:(NSZone *)zone {
	Cell *cell = [[Cell alloc] initWithName:[self name] description:[self description] owner:[self owner] health:[self health] team:[self team]];
	for (Organelle *organelle in [self organelles]) {
		[cell addOrganelle:[organelle copyWithZone: nil]];
	}
	return cell;
}

- (void) addOrganelle: (Organelle *)anOrganelle {
	if (anOrganelle != nil) {
		// Organelle is immutable, no need to defensive copy
		[organelles addObject:[anOrganelle retain]];
		health += [anOrganelle health];
		healthRegenerationPerTick += [anOrganelle healthRegenerationPerTick];
		movementPerTick += [anOrganelle movementPerTick];
		projectileMaximum += [anOrganelle projectileMaximum];
		projectileHealth += [anOrganelle projectileHealth];
	}
}

- (NSInteger) organelleCount {
	return [organelles count];
}

- (Organelle *) organelleAtIndex: (NSInteger)anIndex {
	Organelle *organelle = nil;
	if (anIndex >= 0 && anIndex < [self organelleCount]) {
		organelle = [organelles objectAtIndex:anIndex];
	}
	return organelle;
}

- (void) removeOrganelleIdenticalTo: (Organelle *)anOrganelle {
	if (anOrganelle != nil) {
		[organelles removeObjectIdenticalTo:anOrganelle];
	}
}

- (Organelle *)removeOrganelleAtIndex: (NSInteger)anIndex {
	Organelle *organelle = nil;
	if (anIndex >= 0 && anIndex < [self organelleCount]) {
		organelle = [[organelles objectAtIndex:anIndex] retain];
		[organelles removeObjectAtIndex:anIndex];
		health -= [organelle health];
		healthRegenerationPerTick -= [organelle healthRegenerationPerTick];
		movementPerTick -= [organelle movementPerTick];
		projectileMaximum -= [organelle projectileMaximum];
		projectileHealth -= [organelle projectileHealth];
		[organelle release];
	}
	return organelle;
}

- (void) dealloc {
	[name release];
	[description release];
	[owner release];
	[organelles removeAllObjects];
	[organelles release];
	[super dealloc];
}

@end