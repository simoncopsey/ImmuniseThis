//
//  BackgroundElementController.m
//  ImmuniseThis
//
//  Created by Simon on 18/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "BackgroundElementController.h"


@implementation BackgroundElementController

@synthesize view;


- (id) initWithModel: (BackgroundElement *)aModel centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	if (aModel == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aModel may not be nil"];
	}	
	if (aLocation == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aLocation may not be nil"];
	}
	if (anArena == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anArena may not be nil"];
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
	if (self = [super initWithArena:anArena]) {
		model = [aModel retain];
		view = [[BackgroundElementView alloc] initWithCentre:aLocation arena:arena width:aWidth height:aHeight colour:aColour];
		[arena updateBackgroundElementViewWithModel:model view:view];
	} return self;
}

- (void) run {	
	Cell *cell = [[arena getModelsOfCellWithTeam:kFriendly] lastObject];
	if (cell != nil) {
		CellView *playerCellView = [[arena getViewOfCellWithModel:cell] retain];
		if (playerCellView != nil && ![[view location] isEqual:[playerCellView location]]) {
			[view setMovement:[[Movement alloc] initWithDirection:[[playerCellView movement] direction] - M_PI speed:[[playerCellView movement] speed] * 0.1]];
			[playerCellView release];
			Vector *newCellLocation = [[view movement] calculateNewLocationAndMovementWithOrigin:[view location]];
			[view setLocation: newCellLocation];
			[newCellLocation release];
			// [arena updateLocationOfCellWithModel:model location:newCellLocation];
		}
	}
	angle += (M_PI / 32);
	if (angle >= (M_PI * 2)) {
		angle = 0;
	}
	[view setAngle:angle];
	[view setNeedsDisplay];	
	[cell release];
}


- (void) dealloc {
	[model release];
	[view release];
	[super dealloc];
}

@end
