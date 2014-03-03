//
//  MenuItemView.m
//  ImmuniseThis
//
//  Created by Simon on 24/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "MenuItemView.h"


@implementation MenuItemView

- (id) initWithString:(NSString *)aString origin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	if (self = [super initWithString:aString fontSize:16 origin:aLocation arena:anArena width:aWidth height:aHeight colour:aColour]) {
		// nothing to do
	} return self;	
}
- (id) initWithString:(NSString *)aString centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	if (self = [super initWithString:aString fontSize:16 centre:aLocation arena:anArena width:aWidth height:aHeight colour:aColour]) {
		// nothing to do
	} return self;	
}

@end
