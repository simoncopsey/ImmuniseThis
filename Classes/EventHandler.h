//
//  EventHandler.h
//  ImmuniseThis
//
//	Represents a dependent that is notified upon an event relating to a specific token.
//
//  Created by Simon on 06/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"

typedef enum {
	kHealthDepleted,
	kScoresCompiled
} Event;

@protocol EventHandler<NSObject>

/** method to be called when an event (e.g.: depletion of health, scoring completed) takes places for an associated token **/
- (void) eventWithSubject: (Event)anEvent token:(Token *)aToken;

@end