//
//  ProjectileDispenser.m
//  ImmuniseThis
//
//  Created by Simon on 18/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ProjectileDispenser.h"


@implementation ProjectileDispenser

- (id) initWithTeam: (Team)aTeam arena:(Arena *)anArena projectileColour:(Colour *)aProjectileColour projectileMaximum:(NSInteger)aProjectileMaximum projectileHealth:(NSInteger)aProjectileHealth {
	if (anArena == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anArena may not be nil"];
	}
	if (aProjectileMaximum <= 0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aProjectileMaximum must be greater than 0"];
	}
	if (aProjectileHealth <= 0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aProjectileHealth must be greather than 0"];
	}
	if (self = [super init]) {
		team = aTeam;
		arena = [anArena retain];
		projectileColour = [aProjectileColour retain];
		projectileHealth = aProjectileHealth;
		projectileMaximum = aProjectileMaximum;
		projectileControllers = [[NSMutableArray alloc] init];
		currentProjectileIndex = 0;
		for (NSInteger x = 0; x < projectileMaximum; x++) {
			Projectile *projectile = [[[Projectile alloc] initWithTeam:team health:projectileHealth] autorelease];
			ProjectileController *projectileController = [[ProjectileController alloc] initWithModel:projectile centre:[[[Vector alloc] init] autorelease] arena:arena width:5 height:5 colour:projectileColour];
			[projectileControllers addObject:projectileController];
		}		
	} return self;	
}

- (void) dispenseProjectileAt: (Vector *)aLocation {
	if (aLocation == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aLocation may not be nil"];
	}
	NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
	// TODO: frequency constant specified below
	if (currentTime - lastProjectileTime > 2.0) {
		// TODO: ProjectileController and ComputerCellController have very high cohesion.
		ProjectileController *controller = [projectileControllers objectAtIndex:currentProjectileIndex++%projectileMaximum];
		if ([controller state] == kPaused) {
			[controller resume];
		} else if ([controller state] == kNew) {
			[controller startWithInterval:0.1];
		}
		[[controller view] setVisibility:kVisible];
		[[controller view] setLocation:aLocation];
		lastProjectileTime = currentTime;
	}	
}

- (void) dealloc {
	[arena release];
	[projectileControllers release];
	[super dealloc];
}

@end
