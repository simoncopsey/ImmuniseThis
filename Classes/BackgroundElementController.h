//
//  BackgroundElementController.h
//  ImmuniseThis
//
//	Provides behaviour for the background elements, adding depth to the Arena.
//
//  Created by Simon on 18/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TokenController.h"
#import "BackgroundElementView.h"


@interface BackgroundElementController : TokenController {
	@private
	double angle;
	BackgroundElement *model;
	BackgroundElementView *view;
}

/** view **/
@property (readonly) BackgroundElementView *view;

/** constructs a BackgroundElementController with the given model, arena and configuration details **/
- (id) initWithModel: (BackgroundElement *)aModel centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;

@end
