//
//  Menu.m
//  ImmuniseThis
//
//  Created by Simon on 24/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Menu.h"


@implementation Menu

- (id) initWithGameStateContext: (GameStateContext *)aGameStateContext arena: (Arena *)anArena {
	if (self = [super initWithGameStateContext:aGameStateContext arena:anArena]) {
		[context registerMenuState:self];
		backgroundControllers = [[NSMutableArray alloc] init];
		NSInteger menuItemYPosition = ([arena height] / 2) - 10;
		GameMenuItemController *menuItemOne = [[[GameMenuItemController alloc] initWithGameStateContext:context model:[[MenuItem alloc] initWithName:@"Start Game"] centre:[[Vector alloc] initWithX:([arena width] / 2) y:menuItemYPosition] arena:anArena width:200 height:50 color:[Colour redColour]] autorelease];
		menuItemYPosition += 100;
		ExitMenuitemController *menuItemTwo = [[[ExitMenuitemController alloc] initWithGameStateContext:context model:[[MenuItem alloc] initWithName:@"Exit"] centre:[[Vector alloc] initWithX:([arena width] / 2) y:menuItemYPosition] arena:arena width:200 height:50 color:[Colour redColour]] autorelease];
		menuItemControllers = [[NSArray alloc] initWithObjects:menuItemOne, menuItemTwo, nil];
		state = kNew;
		visibility = kHidden;
	} return self;
}

- (void) run {
	@synchronized(self) {
		if (state == kNew) {
			for (NSInteger x = 0; x < 10; x++) {
				BackgroundElementController *backgroundElementController = [[BackgroundElementController alloc] initWithModel:[[BackgroundElement alloc] init] centre:[[[Vector alloc] initWithX:arc4random() % 320 y:arc4random() % 480] autorelease] arena:arena width:25 height:25 colour:[Colour whiteColour]];
				[[backgroundElementController view] setVisibility:kVisible];
				[backgroundElementController startWithInterval:0.1];
				[backgroundControllers addObject:backgroundElementController];
			}
			for (MenuItemController *menuItem in menuItemControllers) {
				[[menuItem view] setVisibility:kVisible];
			}
			[arena setNeedsDisplay];
		} else if (state == kPaused) {
			[self resume];
		}
		state = kRunning;
	}
}

- (void) pauseWithVisibility: (Visibility)aVisibilityFlag {
	@synchronized(self) {
		if (state == kRunning) {
			for (BackgroundElementController *backgroundElementController in backgroundControllers) {
				[backgroundElementController pause];
				[[backgroundElementController view] setVisibility:aVisibilityFlag];
			}
			for (MenuItemController *menuItemController in menuItemControllers) {
				[[menuItemController view] setVisibility:aVisibilityFlag];
			}			
		}
		state = kPaused;
		visibility = aVisibilityFlag;
		[arena setNeedsDisplay];
	}
}

- (void) resume {
	@synchronized(self) {
		if (state == kPaused) {
			for (BackgroundElementController *backgroundElementController in backgroundControllers) {
				if ([[backgroundElementController view] visibility] == kHidden) {
					[[backgroundElementController view] setVisibility:kVisible];
				}
				[backgroundElementController resume];
			}
			for (MenuItemController *menuItemController in menuItemControllers) {
				if ([[menuItemController view] visibility] == kHidden) {
					[[menuItemController view] setVisibility:kVisible];
				}				
			}			
		} else if (state == kNew) {
			[self run];
		}
		state = kRunning;
		visibility = kVisible;
		[arena setNeedsDisplay];
	}
}

- (void) playerTouchWithInteraction: (InteractionEvent *)anInteractionEvent {
	if (anInteractionEvent != nil) {
		for (MenuItemController *menuItemController in menuItemControllers) {
			MenuItemView *menuItemView = [menuItemController view];
			if ([[anInteractionEvent touchDownLocation] x] >= [[menuItemView location] x]
				&& [[anInteractionEvent touchDownLocation] x] <= ([[menuItemView location] x] + [menuItemView width])
				&& [[anInteractionEvent touchDownLocation] y] >= [[menuItemView location] y]
				&& [[anInteractionEvent touchDownLocation] y] <= ([[menuItemView location] y] + [menuItemView height])) {
				[menuItemController playerTouchWithInteraction:anInteractionEvent];
			}
		}
	}
}


- (void) dealloc {
	[menuItemControllers release];
	for (BackgroundElementController *controller in backgroundControllers) {
		[controller release];
	}
	[backgroundControllers release];
	[arena release];
	[viewController release];
	[super dealloc];
}

@end