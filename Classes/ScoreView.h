//
//  ScoreView.h
//  ImmuniseThis
//
//	Displays the current score of the player.
//
//  Created by Simon on 17/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextView.h"


@interface ScoreView : TextView {
	NSString *prefix;
	NSInteger score;
}

/** current player score **/
@property NSInteger score;

/** constructs a new instance with given configuration details with the origin at a given location **/
- (id) initWithScore: (NSInteger)aScore origin:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;
/** constructs a new instance with given configuration details centred at a given location **/
- (id) initWithScore: (NSInteger)aScore centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;

@end
