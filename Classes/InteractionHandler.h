//
//  InteractionHandler.h
//  ImmuniseThis
//
//	Represents a dependent that is notified upon user interactions.
//
//  Created by Simon on 06/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InteractionEvent.h"


@protocol InteractionHandler<NSObject>

/** method called when a player provides touch interaction **/
- (void) playerTouchWithInteraction: (InteractionEvent *)anInteractionEvent;

@end