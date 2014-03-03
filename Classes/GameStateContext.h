//
//  GameStateContext.h
//  ImmuniseThis
//
//	Represents the current game state and provides methods for switching between them.
//
//  Created by Simon on 11/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameState.h"
#import "InteractionHandler.h"
#import "EventHandler.h"
#import "GameState.h"
#import "Arena.h"

@class GameState; // TODO: Temporary fix

typedef enum {
	kBuilding,
	kBuilt,
} BuildState;

@interface GameStateContext : NSObject<InteractionHandler, EventHandler> {
	@private
	Arena *arena;
	BuildState state;
	GameState *menuState;
	GameState *gameState;
	GameState *endGameState;
	GameState *currentState;
}

@property (readonly, retain) GameState *currentState;

/** construct a GameStateContext instance with the given arena reference **/
- (id) initWithArena: (Arena *)anArena;
/** register the main game state **/
- (void) registerGameState: (GameState *)aGameState;
/** register the menu state **/
- (void) registerMenuState: (GameState *)aMenuState;
/** register the end-game state **/
- (void) registerEndGameState: (GameState *)anEndGameState;
/** give control to the current state **/
- (void) run;
/** switch to the previously-registered menu state **/
- (void) switchToMenuState;
/** switch to the previously-registered game state **/
- (void) switchToGameState;
/** switch to the previously-registered end-game state **/
- (void) switchToEndGameState;

@end