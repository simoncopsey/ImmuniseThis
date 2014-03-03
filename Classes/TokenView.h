//
//  TokenView.h
//  ImmuniseThis
//
//	Represents a generic view.
//
//  Created by Simon on 17/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//
// DESIGN PATTERN: MVC

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import "Colour.h"
#import "Vector.h"
#import "State.h"


@class Arena; // TODO: Temporary fix.


@interface TokenView : UIView {
	@protected
	Colour *colour;
	// TODO: location with Views stores origin (or centre)? Seems to be origin.
	Vector *location;
	NSInteger width;
	NSInteger height;
	Arena *arena;
	Visibility visibility;
}

/** colour of token **/
@property (readonly, copy) Colour *colour;
/** width of token **/
@property (readonly) NSInteger width;
/** height of token **/
@property (readonly) NSInteger height;
/** location of token **/
@property (copy) Vector *location;
// @property Visibility visibility;

/** constructs a new Token with the given configuration information with an origin at the given location **/
- (id) initWithOrigin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;
/** constructs a new Token with the given configuration information centred at the given location **/
- (id) initWithCentre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;
- (Visibility) visibility;
- (void) setVisibility: (Visibility)aVisibilityFlag;
- (void) setRawVisibility:(Visibility)aVisibilityFlag;

@end
