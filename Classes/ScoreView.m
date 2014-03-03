//
//  ScoreView.m
//  ImmuniseThis
//	
//  Created by Simon on 17/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ScoreView.h"


@implementation ScoreView

- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"You must use the [ScoreView initWithOrigin] or [ScoreView initWithCentre] constructor"];
	return nil;
}

- (id) initWithScore: (NSInteger)aScore origin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour {
	return [self initWithCentre:[[[Vector alloc] initWithX:[aLocation x] + (aWidth / 2) y:[aLocation y] + (aHeight / 2)] autorelease] arena:anArena width:aWidth height:aHeight colour:aColour];
}

- (id) initWithScore: (NSInteger)aScore centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour  {
	if (score < 0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aScore may not be less than 0"];
	}
	score = aScore;
	prefix = @"Score: %d";
	if (self = [super initWithString:[NSString stringWithFormat:prefix, score] centre:aLocation arena:anArena width:aWidth height:aHeight colour:aColour]) {
		// nothing to do
	} return self;
}

- (NSInteger) score {
	NSInteger value = 0;
	@synchronized(self) {
		value = score;
	}
	return value;}

- (void) setScore:(NSInteger)aScore {
	@synchronized(self) {
		score = aScore;
		[super setString:[NSString stringWithFormat:prefix, score]];
		[self setNeedsDisplay];
	}
}

- (void) dealloc {
	[prefix release];
	[super dealloc];
}

@end
