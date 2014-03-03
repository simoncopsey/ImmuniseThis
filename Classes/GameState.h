//
//  GameState.h
//  ImmuniseThis
//
//	Represents an abstract game state, e.g.: a menu screen.
//
//  Created by Simon on 11/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>
#import "InteractionHandler.h"
#import "GameStateContext.h"
#import "State.h"
#import "Arena.h"


@class GameStateContext; // TODO: Temporary fix

@interface GameState : UIViewController<InteractionHandler> {
	@protected
	GameStateContext *context;
	Arena *arena;
	State state;
	Visibility visibility;
}

/** constructs a new instance with the given GameStateContext and Arena **/
- (id) initWithGameStateContext: (GameStateContext *)aGameStateContext arena: (Arena *)anArena;
/** transfers control to the game state **/
- (void) run;
// TODO: should visability really be specified here?
/** pauses the game state (and all controllers within) and hides or shows appropriately **/
- (void) pauseWithVisibility: (Visibility)aVisibilityFlag;
/** resumes the game state after pausing previously **/
- (void) resume;

@end