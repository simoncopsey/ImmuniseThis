//
//  Game.h
//  ImmuniseThis
//
//	Represents the central game logic, orchestrating the overall game cycle.
//
//  Created by Simon on 06/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>
#import "PlayerCellController.h"
#import "ComputerCellController.h"
#import "CellConfiguration.h"
#import "BackgroundElementController.h"
#import "GameState.h"
#import "MenuItem.h"
#import "MainMenuItemController.h"
#import "ScoreController.h"


@interface Game : GameState {
	@private
	PlayerCellController *playerController;
	ScoreController *scoreController;
	NSMutableArray *menuItemControllers;
	NSMutableArray *backgroundControllers;
	NSMutableArray *computerControllers;
	UIViewController *viewController;
}

/** constructs an instance with the given GameStateContext and Arena reference **/
- (id) initWithGameStateContext: (GameStateContext *)aGameStateContext arena: (Arena *)anArena;

@end
