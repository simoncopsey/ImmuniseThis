//
//  CellConfiguration.h
//  ImmuniseThis
//
//	Represents a class used for holding the configuration for a new cell, used by the constructor of the Cell Controller.
//
//  Created by Simon on 09/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Colour.h"
#import "Vector.h"


@interface CellConfiguration : NSObject {
	@private
	Colour *colour;
	Vector *location;
	NSInteger radius;	
}

/** desired cell colour **/
@property (readonly, copy) Colour *colour;
/** desired cell location **/
@property (readonly, copy) Vector *location;
/** desired cell radius **/
@property (readonly) NSInteger radius;

/** constucts a new instance with the given configuration details **/
- (id) initWithColour: (Colour *)aColour centre: (Vector *)aLocation radius: (NSInteger)aRadius;

@end
