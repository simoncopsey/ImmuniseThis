//
//  TokenController.m
//  ImmuniseThis
//
//  Created by Simon on 18/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//
// DESIGN PATTERN: MVC

#import "TokenController.h"


@implementation TokenController

- (id) initWithArena: (Arena *)anArena {
	if (anArena == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anArena may not be nil"];
	}
	if (self = [super init]) {
		arena = [anArena retain];
		// TODO: 	[arena updateCellViewWithModel:model view:cellView];
	} return self;
}


- (void) dealloc {
	[arena release];
	[super dealloc];
}

@end
