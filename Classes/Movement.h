//
//  Movement.h
//  ImmuniseThis
//
//	Represents a direction and speed with associated methods.
//
//  Created by Simon on 16/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vector.h"
#import "Arena.h"

@class Arena; // TODO: Temporary fix

@interface Movement : NSObject <NSCopying> {
	@private
	NSInteger hash;
	double direction;
	double speed;
}

// TODO: unit test?
/** direction of movement **/
@property (readonly) double direction;
/** speed of movement **/
@property (readonly) double speed;

/** constructs a movement with a given direction and speed **/
- (id) initWithDirection: (double)aDirection speed: (double)aSpeed;
/** calculates an offset from a start location, based on the given direction and speed **/
- (Vector *) calculateNewLocationAndMovementWithOrigin: (Vector *)aLocation;
/** calculates an offset from a start location, based on a given direction and speed. takes into account the arena walls and rebounds **/
- (Vector *) calculateNewLocationAndMovementWithOrigin: (Vector *)aLocation radius:(NSInteger)aRadius arena: (Arena *)anArena;

@end
