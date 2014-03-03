//
//  Menu.h
//  ImmuniseThis
//
//	Represents the pre/in game menu system.
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

@interface Menu : GameState {
	@private
	NSArray *menuItemControllers;
	NSMutableArray *backgroundControllers;
	UIViewController *viewController;
}

/** constructs an instance with the given GameStateContext and Arena reference **/
- (id) initWithGameStateContext: (GameStateContext *)aGameStateContext arena: (Arena *)anArena;

@end
