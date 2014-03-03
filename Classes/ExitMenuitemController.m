//
//  ExitMenuitemController.m
//  ImmuniseThis
//
//  Created by Simon on 11/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ExitMenuitemController.h"


@implementation ExitMenuitemController

- (id) initWithGameStateContext:(GameStateContext *)aGameStateContext {
	if (self = [super init]) {
		// nothing to do
	} return self;
}

- (void) playerTouchWithInteraction: (InteractionEvent *)anInteractionEvent {
	if (anInteractionEvent != nil) {
		[anInteractionEvent retain];
		NSLog(@"Exit menu item hit");
		[anInteractionEvent release];
	}	
}

@end
