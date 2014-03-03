//
//  GameMenuItemController.h
//  ImmuniseThis
//
//	Represents a controller for the Main Menu menu item that responds to touch interaction.
//
//  Created by Simon on 11/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItemController.h"


@interface MainMenuItemController : MenuItemController {
}

/** constructs an instance with the given GameStateContext reference **/
- (id) initWithGameStateContext:(GameStateContext *)aGameStateContext;

@end
