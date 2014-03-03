//
//  Vector.h
//  ImmuniseThis
//
//	Represents a two dimensional vector containing an X and a Y coordinate.
//
//  Created by Simon on 15/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <math.h>


@interface Vector : NSObject <NSCopying> {
	@private
	double x;
	double y;
	NSInteger hash;
}

/** x coordinate **/
@property (readonly) double x;
/** y coordinate **/
@property (readonly) double y;

/** constructs a new vector with the given x and y coordinates **/
- (id) initWithX: (double)anXCoordinate y: (double)aYCoordinate;
/** calculates distance between this vector instance and another vector instance **/
- (double) distanceTo: (Vector *)aVector;
/** calculates angle in radians from this vector instance to another vector instance **/
- (double) angleToInRadians: (Vector *)aVector;
/** calculates angle in degrees from this vector instance to another vector instance **/
- (double) angleToInDegrees: (Vector *)aVector;
/** private method for removing the sign from a number **/
- (double) makePositive: (double)aValue;

@end
