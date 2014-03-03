//
//  Game.m
//  ImmuniseThis
//
//  Created by Simon on 06/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Game.h"
#import "ComputerCellController.h"


@implementation Game


- (id) initWithGameStateContext: (GameStateContext *)aGameStateContext arena: (Arena *)anArena {
	if (self = [super initWithGameStateContext:aGameStateContext arena:anArena]) {
		[context registerGameState:self];
		menuItemControllers = [[NSMutableArray alloc] init];
		computerControllers = [[NSMutableArray alloc] init];
		backgroundControllers = [[NSMutableArray alloc] init];
		state = kNew;
		visibility = kHidden;
	} return self;
}


- (void) run {
	@synchronized(self) {
		if (state == kNew) {
			// TODO: assertions?
			for (NSInteger x = 0; x < 5; x++) {
				BackgroundElementController *backgroundElementController = [[BackgroundElementController alloc] initWithModel:[[BackgroundElement alloc] init] centre:[[[Vector alloc] initWithX:arc4random() % 320 y:arc4random() % 480] autorelease] arena:arena width:15 height:15 colour:[Colour whiteColour]];
				[[backgroundElementController view] setVisibility:kVisible];
				[backgroundElementController startWithInterval:0.1];
				[backgroundControllers addObject:backgroundElementController];
			}
			
			MainMenuItemController *exitMenuItem = [[[MainMenuItemController alloc] initWithGameStateContext:context model:[[MenuItem alloc] initWithName:@"Pause"] centre:[[Vector alloc] initWithX:300 y:30] arena:arena width:100 height:40 color:[Colour greenColour]] autorelease];
			[menuItemControllers addObject:exitMenuItem];
			[[exitMenuItem view] setVisibility:kVisible];
			
			Cell *playerModel = [[Cell alloc] initWithName:@"Player" description:@"Description" owner:[[Person alloc] initWithName:@"Human"] health:20 team:kFriendly];
			Organelle *playerflagella = [[Organelle alloc] initWithName:@"Flagella" description:@"A Flagella, lending motility" health:0 healthRegenerationPerTick:0 movementPerTick:50 projectileMaximum:0 projectileHealth:0];
			[playerModel addOrganelle:[playerflagella autorelease]];
			Organelle *playerProjectileDispenser = [[Organelle alloc] initWithName:@"Projectile Dispenser" description:@"Dispenses projectiles" health:0 healthRegenerationPerTick:0 movementPerTick:0 projectileMaximum:5 projectileHealth:5];
			[playerModel addOrganelle:[playerProjectileDispenser autorelease]];
			CellConfiguration *playerCellConfiguration = [[CellConfiguration alloc] initWithColour:[Colour greenColour] centre:[[[Vector alloc] initWithX:50 y:50] autorelease] radius:25.0];
			playerController = [[PlayerCellController alloc] initWithModel:playerModel arena:arena configuration:playerCellConfiguration];
			[playerCellConfiguration release];
			[[playerController cellView] setVisibility:kVisible];
			[[playerController textView] setVisibility:kVisible];
			[playerController startWithInterval:0.1];
			
			// TODO: singleton?
			ComputerCellController *computerController = [[[ComputerCellFactory alloc] initWithArena:arena] getComputerCell];
			[computerControllers addObject:computerController];
			[[computerController cellView] setVisibility:kVisible];
			[[computerController textView] setVisibility:kVisible];
			[computerController startWithInterval:0.1];
			
			
			scoreController = [[ScoreController alloc] initWithModel:[[Score alloc] init] arena:arena centre:[[Vector alloc] initWithX:100 y:20] width:70 height:20 colour:[Colour greenColour]];
			[[scoreController view] setVisibility:kVisible];
			[scoreController startWithInterval:0.1];
			
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
			for (ComputerCellController *computerController in computerControllers) {
				[computerController pause];
				[[computerController cellView] setVisibility:aVisibilityFlag];
				[[computerController textView] setVisibility:aVisibilityFlag];
			}
			/*
			if (anIsHiddenFlag) {
				for (Projectile *projectile in [arena projectiles]) {
					// TODO: projectile controller pause
					[[arena getViewOfProjectileWithModel:projectile] removeFromSuperview];
				}
			}
			*/
			[[scoreController view] setVisibility:aVisibilityFlag];
			[[playerController cellView] setVisibility:aVisibilityFlag];
			[[playerController textView] setVisibility:aVisibilityFlag];
			[scoreController pause];
			[playerController pause];
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
			for (ComputerCellController *computerController in computerControllers) {
				if ([[computerController cellView] visibility] == kHidden) {
					[[computerController cellView] setVisibility:kVisible];
					[[computerController textView] setVisibility:kVisible];
				}
				[computerController resume];
			}
			/*
			 TODO: can't get handle to controller
			if (visibility == kHidden) {
				for (Projectile *projectile in [arena projectiles]) {
					// TODO: projectile controller pause
					[arena addSubview:[arena getViewOfProjectileWithModel:projectile]];
				}
			}
			*/
			if ([[scoreController view] visibility] == kHidden) {
				[[scoreController view] setVisibility:kVisible];
				[scoreController resume];
			}
			if ([[playerController cellView] visibility] == kHidden) {
				[[playerController cellView] setVisibility:kVisible];
				[[playerController textView] setVisibility:kVisible];
				[playerController resume];
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
			[anInteractionEvent retain];
			[playerController playerTouchWithInteraction: anInteractionEvent];
			[anInteractionEvent release];
		}
	}
}

- (void) dealloc {
	[playerController release];
	[scoreController release];
	for (BackgroundElementController *controller in backgroundControllers) {
		[controller release];
	}
	[backgroundControllers release];
	for (ComputerCellController *controller in computerControllers) {
		[controller release];
	}
	[computerControllers release];
	[arena release];
	[viewController release];
	[super dealloc];
}

@end
