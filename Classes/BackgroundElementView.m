//
//  BackgroundView.m
//  ImmuniseThis
//
//  Created by Simon on 15/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "BackgroundElementView.h"

@implementation BackgroundElementView

@synthesize movement;

- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"You must use the [BackgroundElementView initWithString] constructor"];
	return nil;
}

- (id) initWithOrigin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	if (self = [super initWithOrigin:aLocation arena:anArena width:aWidth height:aHeight colour:aColour]) {
		// nothing to do
	} return self;	
}

- (id) initWithCentre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	if (self = [super initWithCentre:aLocation arena:anArena width:aWidth height:aHeight colour:aColour]) {
		// nothing to do
	} return self;	
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;	
	if (anObject != nil && [anObject isKindOfClass: [BackgroundElementView class]]) {
		BackgroundElementView *backgroundElementView = (BackgroundElementView *) anObject;
		if ([[self location] isEqual:[backgroundElementView location]] && [self width] == [backgroundElementView width]
			 && [self height] == [backgroundElementView height] && [[self colour] isEqual:[backgroundElementView colour]]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	NSInteger hash = 1;
	hash *= 7 + [[self location] hash];
	hash *= 7 + [self width];
	hash *= 7 + [self height];
	hash *= 7 + [[self colour] hash];
	return hash;
}

- (id) copyWithZone:(NSZone *)zone {
	BackgroundElementView *backgroundElementView = [[BackgroundElementView alloc] initWithOrigin:[[[self location] copyWithZone:nil] autorelease] arena:arena width:[self width] height:[self height] colour:[[[self colour] copyWithZone:nil] autorelease]];
	[backgroundElementView setAngle:[self angle]];
	[backgroundElementView setMovement:[self movement]];
	[backgroundElementView setRawVisibility:[self visibility]];
	return backgroundElementView;
}

- (double) angle {
	NSInteger value = 0;
	@synchronized(self) {
		value = angle;
	}
	return value;
}

- (void) setAngle:(double)anAngle {
	@synchronized(self) {
		angle = anAngle;
	}
}

- (void) drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGRect frame = CGRectMake(rect.origin.x, rect.origin.y, width, height);
	UIColor *color = [[self colour] UIColor];
	CGContextSetStrokeColorWithColor(context, [color CGColor]);
	
	self.center = CGPointMake([location x], [location y]);
	[UIView beginAnimations:@"rotate" context:nil];
	self.transform = CGAffineTransformMakeRotation(angle);
	[UIView commitAnimations];
	
	// [color release];
	CGContextAddRect(context, frame);
	CGContextDrawPath(context, kCGPathStroke);
	self.backgroundColor = [UIColor clearColor];
}

- (void) dealloc {
	[super dealloc];
}

@end