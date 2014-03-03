//
//  TextView.h
//  ImmuniseThis
//
//	Represents a view of textual content for display.
//
//  Created by Simon on 12/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Vector.h"
#import "TokenView.h"
#import "Movement.h"

@class Movement; // TODO: Temporary fix

@interface TextView : TokenView {
	NSString *string;
	Movement *movement;
	NSInteger fontSize;
}

/** string to display **/
@property (copy) NSString *string;
/** current movement **/
@property (copy) Movement *movement;

/** constructs a new instance with given configuration details with the origin at a given location **/
- (id) initWithString:(NSString *)aString origin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;
/** constructs a new instance with given configuration details centred at a given location **/
- (id) initWithString:(NSString *)aString centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;
/** constructs a new instance with given font size and configuration details with the origin at a given location **/
- (id) initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize origin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;
/** constructs a new instance with given font size and configuration details centred at a given location **/
- (id) initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;

@end
