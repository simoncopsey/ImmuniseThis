//
//  GameStateContext.m
//  ImmuniseThis
//
//  Created by Simon on 11/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "GameStateContext.h"

@implementation GameStateContext

@synthesize currentState;

- (id) initWithArena: (Arena *)anArena {
	if (self = [super init]) {
		arena = [anArena retain];
		[[arena eventManager] registerObserver:self];
		// TODO: very simple state management, not as elegant as the Builder pattern!
		state = kBuilding;
	} return self;
}

- (void) registerMenuState:(GameState *)aMenuState {
	@synchronized(self) {
		menuState = [aMenuState retain];
		if (gameState != nil && menuState != nil && endGameState != nil) {
			state = kBuilt;
		}
	}
}

- (void) registerGameState:(GameState *)aGameState {
	@synchronized(self) {
		gameState = [aGameState retain];
		if (gameState != nil && menuState != nil && endGameState != nil) {
			state = kBuilt;
		}
	}
}

- (void) registerEndGameState:(GameState *)anEndGameState {
	@synchronized(self) {
		endGameState = [anEndGameState retain];
		if (gameState != nil && menuState != nil && endGameState != nil) {
			state = kBuilt;
		}
	}
}

- (void) run {
	@synchronized(self) {
		if (state != kBuilt) {
			[NSException raise:NSInternalInconsistencyException format:@"All states must be registered before transitioning to running"];
		}
	}
	currentState = menuState;
	[currentState run];
}

- (void) switchToMenuState {
	@synchronized(self) {
		if (state != kBuilt) {
			[NSException raise:NSInternalInconsistencyException format:@"All states must be registered before switching state"];
		}
		if (currentState != menuState) {
			[currentState pauseWithVisibility:kHidden];
			[menuState resume];
			currentState = menuState;	
		}
	}
}
- (void) switchToGameState {
	@synchronized(self) {
		if (state != kBuilt) {
			[NSException raise:NSInternalInconsistencyException format:@"All states must be registered before switching state"];
		}
		if (currentState != gameState) {
			[currentState pauseWithVisibility:kHidden];
			[gameState resume];
			currentState = gameState;
		}
	}
}

- (void) switchToEndGameState {
	@synchronized(self) {
		if (state != kBuilt) {
			[NSException raise:NSInternalInconsistencyException format:@"All states must be registered before switching state"];
		}
		if (currentState != endGameState) {
			[currentState pauseWithVisibility:kHidden];
			[endGameState resume];
			currentState = endGameState;
		}
	}
}

- (void) playerTouchWithInteraction: (InteractionEvent *)anInteractionEvent {
	[currentState playerTouchWithInteraction:anInteractionEvent];
}

- (void) eventWithSubject: (Event)anEvent token:(Token *)aToken {
	if (anEvent == kScoresCompiled) {
		[self switchToEndGameState];
	}
}

- (void) dealloc {
	[arena release];
	[menuState release];
	[gameState release];
	[endGameState release];
	[super dealloc];
}

@end
