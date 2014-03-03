//
//  EndGame.m
//  ImmuniseThis
//
//  Created by Simon on 24/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "EndGame.h"


@implementation EndGame

- (id) initWithGameStateContext: (GameStateContext *)aGameStateContext arena: (Arena *)anArena {
	if (self = [super initWithGameStateContext:aGameStateContext arena:anArena]) {
		[context registerEndGameState:self];
		backgroundControllers = [[NSMutableArray alloc] init];
		textViews = [[NSMutableArray alloc] init];
		state = kNew;
		visibility = kHidden;
	} return self;
}

- (void) run {
	@synchronized(self) {
		if (state == kNew) {
			NSInteger menuItemYPosition = ([arena height] / 2) - 10;
			TextView *text = [[TextView alloc] initWithString:@"Scores" fontSize:18 centre:[[Vector alloc] initWithX:([arena width] / 2) y:menuItemYPosition] arena:arena width:200 height:40 colour:[Colour greenColour]];
			[textViews addObject:text];
			menuItemYPosition += 40;
			NSMutableArray *scores = [[NSUserDefaults standardUserDefaults] valueForKey:@"scores"];
			for (NSString *score in scores) {
				TextView *text = [[TextView alloc] initWithString:score fontSize:14 centre:[[Vector alloc] initWithX:([arena width] / 2) y:menuItemYPosition] arena:arena width:200 height:40 colour:[Colour greenColour]];
				[textViews addObject:text];
				menuItemYPosition += 40;
			}			
			for (NSInteger x = 0; x < 10; x++) {
				BackgroundElementController *backgroundElementController = [[BackgroundElementController alloc] initWithModel:[[BackgroundElement alloc] init] centre:[[[Vector alloc] initWithX:arc4random() % 320 y:arc4random() % 480] autorelease] arena:arena width:15 height:15 colour:[Colour whiteColour]];
				[[backgroundElementController view] setVisibility:kVisible];
				[backgroundElementController startWithInterval:0.1];
				[backgroundControllers addObject:backgroundElementController];
			}
			for (TextView *textView in textViews) {
				[textView setVisibility:kVisible];
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
			for (TextView *textView in textViews) {
				[textView setVisibility:aVisibilityFlag];
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
			for (TextView *textView in textViews) {
				if ([textView visibility] == kHidden) {
					[textView setVisibility:kVisible];
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
	/*
	if (anInteractionEvent != nil) {
		for (MenuItemController *menuItemController in menuItemControllers) {
			MenuItemView *menuItemView = [menuItemController view];
			if ([anInteractionEvent isSingleTap] &&
				[[anInteractionEvent touchDownLocation] x] >= [[menuItemView location] x]
				&& [[anInteractionEvent touchDownLocation] x] <= ([[menuItemView location] x] + [menuItemView width])
				&& [[anInteractionEvent touchDownLocation] y] >= [[menuItemView location] y]
				&& [[anInteractionEvent touchDownLocation] y] <= ([[menuItemView location] y] + [menuItemView height])) {
				[menuItemController playerTouchWithInteraction:anInteractionEvent];
			}
		}
	}
	 */
}


- (void) dealloc {
	[textViews release];
	for (BackgroundElementController *controller in backgroundControllers) {
		[controller release];
	}
	[backgroundControllers release];
	[arena release];
	[viewController release];
	[super dealloc];
}

@end