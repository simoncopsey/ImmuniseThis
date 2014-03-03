//
//  MenuItemController.h
//  ImmuniseThis
//
//	Represents the logic behind a menu item.
//
//  Created by Simon on 07/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItemView.h"
#import "InteractionHandler.h"
#import "MenuItem.h"
#import "GameStateContext.h"

@class GameStateContext; // TODO: Temporary fix

// TODO: extend TokenController as MenuItem extends Token?
@interface MenuItemController : NSObject<InteractionHandler> {
	@protected
	GameStateContext *context;
	MenuItemView *view;
	MenuItem* model;
	Arena* arena;
}

/** view **/
@property (readonly) MenuItemView *view;

/** constructs a new instance with a given GameStateContext reference, model and configuration details **/
- (id) initWithGameStateContext:(GameStateContext *)aGameStateContext model: (MenuItem *)aModel centre: (Vector *)aLocation arena:(Arena *)anArena width: (NSInteger)aWidth height: (NSInteger)aHeight color: (Colour *)aColour;

@end