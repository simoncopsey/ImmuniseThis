//
//  ScoreController.m
//  ImmuniseThis
//
//  Created by Simon on 17/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ScoreController.h"


@implementation ScoreController

@synthesize model;
@synthesize view;

- (id) initWithModel: (Score *)aModel arena: (Arena *)anArena centre: (Vector *)aLocation width: (NSInteger)aWidth height: (NSInteger)aHeight colour:(Colour *)aColour {
	if (anArena == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anArena may not be nil"];
	}
	if (aModel == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aModel may not be nil"];
	}	
	if (aLocation == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aLocation may not be nil"];
	}		
	if (self = [super init]) {
		model = [aModel retain];
		view = [[ScoreView alloc] initWithScore:[model score] centre:aLocation arena:anArena width:aWidth height:aHeight colour:aColour];
		arena = [anArena retain];
		location = [aLocation copyWithZone:nil];
		[[arena collisionManager] registerObserver:self];
		[[arena eventManager] registerObserver:self];
	} return self;
}

- (void) collisionOfToken: (Token *)aFirstToken withToken: (Token *)aSecondToken {
	if ([aFirstToken isKindOfClass:[Cell class]] && [aSecondToken isKindOfClass:[Projectile class]]
		 && [aFirstToken team] != [aSecondToken team]) {
		NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
		if ([aFirstToken team] == kFriendly && currentTime - lastFriendlyHitTime > 1.0) {
			[model setScore: [model score] - 50];
			[view setScore:[model score]];
			lastFriendlyHitTime = currentTime;
		} else if ([aFirstToken team] == kEnemy && currentTime - lastEnemyHitTime > 1.0) {
			[model setScore: [model score] + 50];
			[view setScore:[model score]];
			lastEnemyHitTime = currentTime;
		}
	}
}

- (void) run {
	[model setScore:[model score] + 1];
	[view setScore: [model score]];
}

- (void) collisionWithArenaBoundsOfToken:(Token *)aToken {
	// nothing to do.
}

- (void) eventWithSubject: (Event)anEvent token:(Token *)aToken {
	// TODO: (horrible) pragmatic hack!
	if (anEvent == kHealthDepleted && [aToken team] == kFriendly) {
		NSUserDefaults *userPreferences = [NSUserDefaults standardUserDefaults];
		NSMutableArray *scores = nil;
		if ([userPreferences objectForKey:@"scores"] == nil) {
			scores = [[NSMutableArray alloc] init];
		} else {
			scores = [[userPreferences objectForKey:@"scores"] retain];
		}
		[scores addObject:[NSString stringWithFormat:@"%d", [model score]]];
		while ([scores count] > 5) {
			[scores removeObjectAtIndex:0];
		}
		[userPreferences setObject:scores forKey:@"scores"];
		[userPreferences synchronize];
		[scores release];
		[[arena eventManager] notifyObserversOfEvent:kScoresCompiled token:nil];
	}
}

- (void) dealloc {
	[model release];
	[view release];
	[arena release];
	[super dealloc];
}

@end