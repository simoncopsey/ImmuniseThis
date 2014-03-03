//
//  Colour.m
//  ImmuniseThis
//
//  Created by Simon on 23/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//
// DESIGN PATTERN: Factory Method

#import "Colour.h"


@implementation Colour

@synthesize alpha;
@synthesize red;
@synthesize green;
@synthesize blue;

// TODO: cache below colours for added performance
+ (Colour *)blackColour {
	return [[[Colour alloc] initWithAlpha:255 red:0 green:0 blue:0] autorelease];
}

+ (Colour *)whiteColour {
	return [[[Colour alloc] initWithAlpha:255 red:255 green:255 blue:255] autorelease];
}

+ (Colour *)redColour {
	return [[[Colour alloc] initWithAlpha:255 red:255 green:0 blue:0] autorelease];
}

+ (Colour *)greenColour {
	return [[[Colour alloc] initWithAlpha:255 red:0 green:255 blue:0] autorelease];
}

+ (Colour *)blueColour {
	return [[[Colour alloc] initWithAlpha:255 red:0 green:0 blue:255] autorelease];
}

- (id) initWithAlpha:(double)anAlphaAmount red:(double)aRedAmount green:(double)aGreenAmount blue:(double)aBlueAmount  {
	if (self = [super init]) {
		hash = 0;
		alpha = anAlphaAmount;
		red = aRedAmount;
		green = aGreenAmount;
		blue = aBlueAmount;
	} return self;
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;
	if (anObject != nil && [anObject isKindOfClass: [Colour class]]) {
		Colour *colour = (Colour *) anObject;
		if ([self alpha] == [colour alpha] && [self red] == [colour red] && [self green] == [colour green] && [self blue] == [colour blue]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	if (hash < 1) {
		NSInteger newHash = 1;
		newHash *= 7 + [self alpha];
		newHash *= 7 + [self red];
		newHash *= 7 + [self green];
		newHash *= 7 + [self blue];
		hash = newHash;
	}
	return hash;
}

- (id) copyWithZone:(NSZone *)zone {
	Colour *colour = [[Colour alloc] initWithAlpha:alpha red:red green:green blue:blue];
	// return [colour autorelease];
	return colour;
}

- (UIColor *) UIColor {
	return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (void) dealloc {
	[super dealloc];
}

@end