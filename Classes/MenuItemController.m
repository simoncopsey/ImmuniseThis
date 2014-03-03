//
//  MenuItemController.m
//  ImmuniseThis
//
//  Created by Simon on 07/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "MenuItemController.h"


@implementation MenuItemController

@synthesize view;

- (id) initWithGameStateContext:(GameStateContext *)aGameStateContext model: (MenuItem *)aModel centre: (Vector *)aLocation arena:(Arena *)anArena width: (NSInteger)aWidth height: (NSInteger)aHeight color: (Colour *)aColour {
	if (aGameStateContext == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aGameStateContext may not be nil"];
	}
	if (aModel == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aModel may not be nil"];
	}
	if (aLocation == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aLocation may not be nil"];
	}	
	if (aWidth <= 0.0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aWidth must be greater than 0"];
	}	
	if (aHeight <= 0.0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aHeight must be greater than 0"];
	}
	if (aColour == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aColour may not be nil"];
	}	
	if (self = [super init]) {
		context = [aGameStateContext retain];
		model = [aModel retain];
		view = [[MenuItemView alloc] initWithString:[NSString stringWithString:[model name]] centre:[aLocation copyWithZone:nil] arena:anArena width:aWidth height:aHeight colour:[aColour copyWithZone:nil]];
	} return self;
}

- (void) playerTouchWithInteraction: (InteractionEvent *)anInteractionEvent {
	[NSException raise:NSInternalInconsistencyException format:@"playerTouchWithInteraction method must be overriden"];
}

- (void) dealloc {
	[view release];
	[model release];
	[arena release];
	[super dealloc];
}

@end
