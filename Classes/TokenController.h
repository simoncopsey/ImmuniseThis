//
//  TokenController.h
//  ImmuniseThis
//
//	Represents a generic Token Controller class for wiring up a token view and model with behaviour.
//
//  Created by Simon on 18/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimerTask.h"
#import "Arena.h"
#import "TokenView.h"


@interface TokenController : TimerTask {
	@protected
	Arena *arena;
}

/** constructs a new instance with a given Arena reference **/
- (id) initWithArena: (Arena *)anArena;

@end
