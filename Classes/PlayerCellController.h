//
//  PlayerCellController.h
//  ImmuniseThis
//
//	Represents a cell controlled by the player touch interactions.
//
//  Created by Simon on 07/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
#import "CellController.h"
#import "InteractionEvent.h"
#import "InteractionHandler.h"


@interface PlayerCellController : CellController <CollisionHandler, InteractionHandler> {
	Projectile *lastProjectileHit;
}

@end
