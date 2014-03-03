//
//  ProjectileController.m
//  ImmuniseThis
//
//  Created by Simon on 18/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ProjectileController.h"


@implementation ProjectileController

@synthesize model;
@synthesize view;

- (id) initWithModel: (Projectile*)aModel centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	if (aModel == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aModel may not be nil"];
	}
	if (aLocation == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aLocation may not be nil"];
	}
	if (anArena == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anArena may not be nil"];
	}	
	if (aWidth <= 0.0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aWidth must be greater than 0"];
	}	
	if (aHeight <= 0.0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aHeight must be greater than 0"];
	}	
	if (aColour == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aColour may not be nil"];
	}
	if (self = [super initWithArena:anArena]) {
		model = [aModel retain];
		view = [[ProjectileView alloc] initWithCentre:aLocation arena:arena width:aWidth height:aHeight colour:aColour];
		[arena updateProjectileViewWithModel:model view:view];
		[[arena collisionManager] registerObserver:self];
	} return self;
}

- (void) run {
	// TODO: check retain count in arena and remove from array after x seconds via NSTimer.
	angle += (M_PI / 32);
	if (angle >= (M_PI * 2)) {
		angle = 0;
	}
	[view setAngle:angle];
	[view setNeedsDisplay];
}

- (void) collisionOfToken: (Token *)aFirstToken withToken: (Token *)aSecondToken {
	// TODO: taking advantage of how ComputerCellController 'reuses' projectiles.
	if ([aFirstToken team] != [aSecondToken team] && [model isEqual: ((Projectile *) aSecondToken)]) {
		[view setVisibility:kHidden];
		if (state == kRunning) {
			[self pause];
		}
	}	
}

- (void) collisionWithArenaBoundsOfToken: (Token *)aToken {
	// nothing to do.
}

- (void) dealloc {
	[model release];
	[view release];
	[super dealloc];
}

@end
