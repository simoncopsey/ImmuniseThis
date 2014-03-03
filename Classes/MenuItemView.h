//
//  MenuItemView.h
//  ImmuniseThis
//
//	Represents the view of an item for displaying within a Menu.
//
//  Created by Simon on 24/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextView.h"

@interface MenuItemView : TextView {
	// TODO: on-tap action information
}

/** constructs a new instance with given configuration details with the origin at a given location **/
- (id) initWithString:(NSString *)aString origin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;
/** constructs a new instance with given configuration details centred at a given location **/
- (id) initWithString:(NSString *)aString centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;

@end
