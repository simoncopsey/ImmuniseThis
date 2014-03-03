//
//  ProjectileDispenser.h
//  ImmuniseThis
//
//	An add-on to a cell which drops projectiles at specific intervals **/
//
//  Created by Simon on 18/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Projectile.h"
#import "Arena.h"
#import "ProjectileController.h"


@interface ProjectileDispenser : NSObject {
	@private
	Team team;
	Arena *arena;
	Colour *projectileColour;
	NSInteger projectileHealth;
	NSMutableArray *projectileControllers;
	NSTimeInterval lastProjectileTime;
	NSInteger projectileMaximum;
	NSInteger currentProjectileIndex;
}

/** constructs a new instance with the given configuration details **/
- (id) initWithTeam: (Team)aTeam arena:(Arena *)anArena projectileColour:(Colour *)aProjectileColour projectileMaximum:(NSInteger)aProjectileMaximum projectileHealth:(NSInteger)aProjectileHealth;
/** dispenses a projectile at given location if interval between last call and current call is sufficient **/
- (void) dispenseProjectileAt: (Vector *)aLocation;

@end
