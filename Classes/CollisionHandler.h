//
//  InteractionHandler.h
//  ImmuniseThis
//
//	Represents a dependent that is notified upon a collision with a Token.
//
//  Created by Simon on 06/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"


@protocol CollisionHandler<NSObject>

/** method to be called on collision between two tokens **/
- (void) collisionOfToken: (Token *)aFirstToken withToken: (Token *)aSecondToken;
/** method to be called on collision between token and arena wall **/
- (void) collisionWithArenaBoundsOfToken: (Token *)aToken;

@end