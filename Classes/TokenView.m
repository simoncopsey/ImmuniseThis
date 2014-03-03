//
//  TokenView.m
//  ImmuniseThis
//
//  Created by Simon on 17/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "TokenView.h"


@implementation TokenView

@synthesize width;
@synthesize height;
@synthesize colour;

- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"You must use the [View initWithName] constructor"];
	return nil;
}

- (id) initWithOrigin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	if (anArena == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anArena must not be nil"];
	}	
	if (aWidth <= 0.0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aWidth must be greater than 0"];
	}	
	if (aHeight <= 0.0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aHeight must be greater than 0"];
	}
	CGRect frame = CGRectMake([aLocation x], [aLocation y], aWidth, aHeight);
	if (self = [super initWithFrame:frame]) {
		width = aWidth;
		height = aHeight;
		if (aColour == nil) { 
			colour = [[Colour redColour] retain];
		} else {
			colour = [aColour copyWithZone:nil];
		}
		// TODO: location stores origin here instead of centre?!
		if (aLocation == nil) { 
			location = [[Vector alloc]  initWithX:160 y:240];
		} else {
			location = [aLocation copyWithZone:nil];
		}
		arena = [anArena retain];
		visibility = kHidden;
	} return self;
}

- (id) initWithCentre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	return [self initWithOrigin:[[[Vector alloc] initWithX:([aLocation x] - (aWidth / 2)) y:([aLocation y] - (aHeight / 2))] autorelease] arena:anArena width:aWidth height:aHeight colour:aColour];
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;	
	if (anObject != nil && [anObject isKindOfClass: [TokenView class]]) {
		TokenView *view = (TokenView *) anObject;
		if ([[self colour] isEqual:[view colour]] && [self width] == [view width] && [self height] == [view height]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	NSInteger hash = 1;
	hash *= 7 + [[self colour] hash];;
	hash *= 7 + [self width];
	hash *= 7 + [self height];
	return hash;
}

- (id) copyWithZone:(NSZone *)zone {
	TokenView *view = [[TokenView alloc] initWithCentre:[[location copyWithZone:nil] autorelease] arena:arena width:width height:height colour:[[colour copyWithZone:nil] autorelease]];
	return view;
}

- (Visibility) visibility {
	return visibility;
}

// TODO: horrible pragmatic approach for copyWithZone!
- (void) setRawVisibility:(Visibility)aVisibilityFlag {
	@synchronized(self) {
		visibility = aVisibilityFlag;
	}
}

- (void) setVisibility:(Visibility)aVisibilityFlag {
	@synchronized(self) {
		if (aVisibilityFlag == kVisible && visibility == kHidden) {
			[arena addSubview:self];
			visibility = kVisible;
		} else if (aVisibilityFlag == kHidden && visibility == kVisible) {
			[self removeFromSuperview];
			visibility = kHidden;
		}
		[self setNeedsDisplay];
	}
}

- (id) location {
	Vector *value = nil;
	@synchronized(self) {
		value = [location retain];
	}
	return [value autorelease];
}

- (void) setLocation:(Vector *)aLocation {
	@synchronized(self) {
		if (location != nil) {
			[location release];
			location = [aLocation copyWithZone:nil];
			self.center = CGPointMake([location x], [location y]);
			[self setNeedsDisplay];
		}
	}
}

- (void) dealloc {
	[colour release];
	[location release];
	[arena release];
	[super dealloc];
}

@end