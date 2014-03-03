//
//  ScoreController.h
//  ImmuniseThis
//
//	Represents a Score Controller class for wiring up a score view (shown in-game) and model with behaviour.
//
//  Created by Simon on 17/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Score.h"
#import "ScoreView.h"
#import "EventHandler.h"


@interface ScoreController : TimerTask <CollisionHandler, EventHandler> {
	@private
	Score *model;
	ScoreView *view;
	Arena *arena;
	Vector *location;
	NSTimeInterval lastFriendlyHitTime;
	NSTimeInterval lastEnemyHitTime;
}

/** model **/
@property (readonly, copy) Score *model;
/** view **/
@property (readonly, copy) ScoreView *view;

/** constucts a new instance with the given model, arena and configuration details **/
- (id) initWithModel: (Score *)aModel arena: (Arena *)anArena centre: (Vector *)aLocation width: (NSInteger)aWidth height: (NSInteger)aHeight colour:(Colour *)aColour;

@end
