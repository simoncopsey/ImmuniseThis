//
//  ProjectileController.h
//  ImmuniseThis
//
//  Created by Simon on 18/03/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TokenController.h"
#import "ProjectileView.h"
#import "Projectile.h"
#import "ComputerCellFactory.h"


@interface ProjectileController : TokenController <CollisionHandler> {
	@private
	double angle;
	ProjectileView *view;
	Projectile *model;
}

/** model **/
@property (readonly) Projectile *model;
/** view **/
@property (readonly) ProjectileView *view;

/** constructs a new ProjectileController with the given model, arena and configuration details **/
- (id) initWithModel: (Projectile *)aModel centre:(Vector *)aLocation arena:(Arena *)anArena width:(NSInteger)aWidth height:(NSInteger)aHeight colour:(Colour *)aColour;

@end