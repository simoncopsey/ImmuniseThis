//
//  ProjectileView.m
//  ImmuniseThis
//
//  Created by Simon on 17/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ProjectileView.h"

@implementation ProjectileView

@synthesize movement;


- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"You must use the [ProjectileView initWithString] constructor"];
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

- (id) copyWithZone:(NSZone *)zone {
	ProjectileView *projectileView = [[ProjectileView alloc] initWithOrigin:[[[self location] copyWithZone:nil] autorelease] arena:arena width:[self width] height:[self height] colour:[[[self colour] copyWithZone:nil] autorelease]];
	[projectileView setAngle:[self angle]];
	[projectileView setMovement:[self movement]];
	[projectileView setRawVisibility:visibility];
	return projectileView;
}

- (double) angle {
	NSInteger value = 0;
	@synchronized(self) {
		value = angle;
	}
	return value;}

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
