//
//  Organelle.m
//  ImmuniseThis
//
//  Created by Simon on 03/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Organelle.h"


@implementation Organelle

@synthesize name;
@synthesize description;
@synthesize health;
@synthesize healthRegenerationPerTick;
@synthesize movementPerTick;
@synthesize projectileMaximum;
@synthesize projectileHealth;


// TODO: enabling below constructor is bad
/*
- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"You must use the [Organelle initWithName] constructor"];
	return nil;
}
*/

- (id) initWithName: (NSString *)aName description: (NSString *)aDescription health: (NSInteger)aHealthAmount healthRegenerationPerTick: (NSInteger)aHealthRegenerationAmount movementPerTick: (NSInteger)aMovementAmount projectileMaximum: (NSInteger)aProjectileMaximum projectileHealth: (NSInteger) aProjectileHealth {
	if (aName == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aName may not be nil"];
	}	
	if (self = [super init]) {
		hash = 0;
		name = [[NSString stringWithString:aName] retain];
		description = nil;
		if (aDescription != nil) {
			description = [[NSString stringWithString:aDescription] retain];
		}
		health = aHealthAmount;
		healthRegenerationPerTick = aHealthRegenerationAmount;
		movementPerTick = aMovementAmount;
		projectileMaximum = aProjectileMaximum;
		projectileHealth = aProjectileHealth;
	} return self;
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;
	if (anObject != nil && [anObject isKindOfClass: [Organelle class]]) {
		Organelle *organelle = (Organelle *) anObject;
		if ([[self name] isEqual:[organelle name]] && [[self description] isEqual:[organelle description]] && [self health] == [organelle health]
			&& [self healthRegenerationPerTick] == [organelle healthRegenerationPerTick] && [self movementPerTick] == [organelle movementPerTick]
			&& [self projectileMaximum] == [organelle projectileMaximum] && [self projectileHealth] == [organelle projectileHealth]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	if (hash < 1) {
		NSInteger newHash = 1;
		newHash *= 7 + [[self name] hash];
		newHash *= 7 + [[self description] hash];
		newHash *= 7 + [self health];
		newHash *= 7 + [self healthRegenerationPerTick];
		newHash *= 7 + [self movementPerTick];
		newHash *= 7 + [self projectileMaximum];
		newHash *= 7 + [self projectileHealth];
		hash = newHash;
	}
	return hash;
}

- (id) copyWithZone:(NSZone *)zone {
	Organelle *organelle = [[Organelle alloc] initWithName:[self name] description:[self description] health:[self health] healthRegenerationPerTick:[self healthRegenerationPerTick] movementPerTick:[self movementPerTick] projectileMaximum:[self projectileMaximum] projectileHealth:[self projectileHealth]];
	return organelle;
}

- (void) dealloc {
	[name release];
	[description release];
	[super dealloc];
}

@end