//
//  ComputerCellController.h
//  ImmuniseThis
//
//	Represents the computer-orchestrated cell actions.
//
//  Created by Simon on 15/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "ProjectileController.h"
#import "CellController.h"


@interface ComputerCellController : CellController {
	Projectile *lastProjectileHit;
}

/** constucts a ComputerCellController with the given model and arena **/
- (id) initWithModel: (Cell *)aModel arena: (Arena *)anArena;
/** constucts a ComputerCellController with the given model, arena and configuration details **/
- (id) initWithModel: (Cell *)aModel arena: (Arena *)anArena configuration: (CellConfiguration *)aCellConfiguration;

@end
