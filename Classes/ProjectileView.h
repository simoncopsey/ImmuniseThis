//
//  RotatingElementView.h
//  ImmuniseThis
//
//	Represents a view of a rotating rectangle projectile.
//
//  Created by Simon on 17/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TokenView.h"
#import "Vector.h"
#import "Colour.h"
#import "Movement.h"

@class Movement; // TODO: Temporary fix

@interface ProjectileView : TokenView <NSCopying> {
	double angle;
	Movement *movement;
}

/** current rotation angle **/
@property double angle;
/** current movement **/
@property (copy) Movement *movement;

/** constructs a new instance with given configuration details with the origin at a given location **/
- (id) initWithOrigin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;
/** constructs a new instance with given configuration details centred at a given location **/
- (id) initWithCentre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;

@end
