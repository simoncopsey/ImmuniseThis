//
//  GameState.m
//  ImmuniseThis
//
//  Created by Simon on 11/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//
// DESIGN PATTERN: State

#import "GameState.h"


@implementation GameState

- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"You must use the [GameState initWithGameContext] constructor"];
	return nil;
}

- (id) initWithGameStateContext: (GameStateContext *)aGameStateContext arena: (Arena *)anArena {
	if (aGameStateContext == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aGameStateContext must be greater than 0"];
	}
	if (anArena == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anArena must not be nil"];
	}
	if (self = [super init]) {
		context = [aGameStateContext retain];
		arena = [anArena retain];
	} return self;	
}

- (void) run {
	[NSException raise:NSInternalInconsistencyException format:@"run method must be overriden"];
}

- (void) pauseWithVisibility: (Visibility)aVisibilityFlag {
	[NSException raise:NSInternalInconsistencyException format:@"pauseWithVisibility method must be overriden"];
}

- (void) resume {
	[NSException raise:NSInternalInconsistencyException format:@"resume method must be overriden"];
}

- (void) playerTouchWithInteraction: (InteractionEvent *)anInteractionEvent {
	[NSException raise:NSInternalInconsistencyException format:@"playerTouchWithInteraction method must be overriden"];
}

- (void) dealloc {
	[super dealloc];
}

@end
