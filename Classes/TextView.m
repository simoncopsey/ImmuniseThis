//
//  TextView.m
//  ImmuniseThis
//
//  Created by Simon on 12/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "TextView.h"

@implementation TextView

@synthesize movement;

- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"You must use the [TextView initWithString] constructor"];
	return nil;
}

- (id) initWithString:(NSString *)aString origin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	return [self initWithString:aString fontSize:12 origin:[[[Vector alloc] initWithX:[aLocation x] + (aWidth / 2) y:[aLocation y] + (aHeight / 2)] autorelease] arena:anArena width:aWidth height:aHeight colour:aColour];
}

- (id) initWithString:(NSString *)aString centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour  {
	return [self initWithString:aString fontSize:12 centre:[[[Vector alloc] initWithX:[aLocation x] + (aWidth / 2) y:[aLocation y] + (aHeight / 2)] autorelease] arena:anArena width:aWidth height:aHeight colour:aColour];	
}

// TODO: below constructor may not work correctly?
- (id) initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize origin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	return [self initWithString:aString fontSize:aFontSize centre:[[[Vector alloc] initWithX:[aLocation x] + (aWidth / 2) y:[aLocation y] + (aHeight / 2)] autorelease] arena:anArena width:aWidth height:aHeight colour:aColour];
}

- (id) initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour  {
	if (aString == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aString may not be nil"];
	}
	if (aFontSize <= 0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aFontSize must be greater than 0"];
	}	
	if (aLocation == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aLocation may not be nil"];
	}
	if (self = [super initWithCentre:aLocation arena:anArena width:aWidth height:aHeight colour:aColour]) {
		string = [[NSString stringWithString:aString] retain];
 		movement = [[Movement alloc] initWithDirection:0 speed:0];
		fontSize = aFontSize;
	} return self;
}

- (id) string {
	return [NSString stringWithString:string];
}

- (void) setString:(NSString *)aString {
	[string release];
	string = [[NSString stringWithString:aString] retain];
	[self setNeedsDisplay];
}

- (void) drawRect:(CGRect)rect {
	// TODO: below is not most efficient implementation
	// http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/TextLayout/Tasks/DrawingStrings.html
	CGContextRef context = UIGraphicsGetCurrentContext();
	// CGContextSetCharacterSpacing (context, 10);
	CGContextSetTextDrawingMode (context, kCGTextFill);
	CGContextSetRGBFillColor (context, [colour red], [colour green], [colour blue], [colour alpha]);
	// CGContextSetRGBStrokeColor (context, 0, 0, 1, 1);
	[string drawAtPoint:CGPointMake(0, 0) withFont:[UIFont fontWithName:@"Helvetica" size:fontSize]];
	// TODO below does not need to be called in each loop, as with CellView
	self.backgroundColor = [UIColor clearColor];
}

- (void) dealloc {
	[string release];
	[location release];
	[movement release];
	[super dealloc];
}

@end
