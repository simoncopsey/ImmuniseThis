//
//  EndGame.h
//  ImmuniseThis
//
//	Represents the end-game (score) screen.
//
//  Created by Simon on 24/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>
#import "ComputerCellController.h"
#import "Arena.h"
#import "InteractionEvent.h"
#import "BackgroundElementController.h"
#import "MenuItemController.h"
#import "GameMenuItemController.h"
#import "ExitMenuitemController.h"


@class Arena; // TODO: Temporary fix

@interface EndGame : GameState {
@private
	NSMutableArray *backgroundControllers;
	NSMutableArray *textViews;
	UIViewController *viewController;
}

/** constructs an instance with the given GameStateContext and Arena reference **/
- (id) initWithGameStateContext: (GameStateContext *)aGameStateContext arena: (Arena *)anArena;

@end
