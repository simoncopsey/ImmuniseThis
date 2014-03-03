//
//  CellController.m
//  ImmuniseThis
//
//  Created by Simon on 15/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "CellController.h"

@implementation CellController

@synthesize model;
@synthesize cellView;
@synthesize textView;

- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"You must use the [CellController initWithView] constructor"];
	return nil;
}

- (id) initWithModel: (Cell *)aModel arena: (Arena *)anArena {
	return [self initWithModel:aModel arena:anArena configuration:nil];
}


- (id) initWithModel: (Cell *)aModel arena: (Arena *)anArena configuration: (CellConfiguration *)aCellConfiguration {
	if (aModel == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aModel may not be nil"];
	}
	if (self = [super initWithArena:anArena]) {
		model = [aModel retain];
		NSInteger health = [model health];
		for (Organelle *organelle in [model organelles]) {
			health += [organelle health];
		}
		Vector *location = nil;
		NSInteger radius = 25;
		Colour *colour = nil;
		if (aCellConfiguration != nil) {
			location = [[[aCellConfiguration location] copyWithZone:nil] autorelease];
			radius = [aCellConfiguration radius];
			colour = [[[aCellConfiguration colour] copyWithZone:nil] autorelease];
		}
		cellView = [[CellView alloc] initWithName:[NSString stringWithString:[model name]] centre:location arena:arena radius:radius team:[model team] colour:colour health:health];
		// TODO: refactor: (radius * 2) + 20 is here, ComputerCellController and PlayerCellController.
		Vector *textLocation = [[[Vector alloc] initWithX:([location x] + (radius * 2) + 30) y:[location y]] autorelease];
		textView = [[TextView alloc] initWithString:@"" centre:textLocation arena:arena width:(radius * 2) + 40 height:(radius * 2) colour:colour];
		
		if ([model projectileMaximum] > 0 && [model projectileHealth] > 0) {
			projectileDispenser = [[ProjectileDispenser alloc] initWithTeam:[model team] arena:arena projectileColour:[cellView colour] projectileMaximum:[model projectileMaximum] projectileHealth:[model projectileHealth]];
		}
		
		[arena updateCellViewWithModel:model view:cellView];
		[[arena collisionManager] registerObserver:self];
	} return self;
}

- (void) collisionOfToken: (Token *)aFirstToken withToken: (Token *)aSecondToken {
	[NSException raise:NSInternalInconsistencyException format:@"collisionOfToken method must be overriden"];
}

- (void) collisionWithArenaBoundsOfToken:(Token *)aToken {
	[NSException raise:NSInternalInconsistencyException format:@"collisionWithArenaBoundsOfToken method must be overriden"];
}

- (void) dealloc {
	[model release];
	[cellView release];
	[textView release];
	[projectileDispenser release];
	[super dealloc];
}

@end