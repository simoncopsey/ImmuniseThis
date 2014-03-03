//
//  Organelle.h
//  ImmuniseThis
//
//	Represents the model of a generic cell Organelle for adding features to cells in a componetised fashion.
//
//  Created by Simon on 03/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Organelle : NSObject <NSCopying> {
	@private
	NSString *name;
	NSString *description;
	NSInteger health;
	NSInteger healthRegenerationPerTick;
	NSInteger movementPerTick;
	NSInteger projectileMaximum;
	NSInteger projectileHealth;
	NSInteger hash;
}

/** name of organelle **/
@property (readonly, copy) NSString *name;
/** description of organelle **/
@property (readonly, copy) NSString *description;
/** health organelle adds to cell upon addition **/
@property (readonly) NSInteger health;
/** health regenerated per game loop to cell loop upon addition **/
@property (readonly) NSInteger healthRegenerationPerTick;
/** extra movement per game loop offered to cell upon addition **/
@property (readonly) NSInteger movementPerTick;
/** extra number of projectiles for cell allowed in arena at once upon addition **/
@property (readonly) NSInteger projectileMaximum;
/** health organelle adds to projectiles upon addition **/
@property (readonly) NSInteger projectileHealth;

/** constructs a new organelle with the given configuration details **/
- (id) initWithName: (NSString *)aName description: (NSString *)aDescription health: (NSInteger)aHealthAmount healthRegenerationPerTick: (NSInteger)aHealthRegenerationAmount movementPerTick: (NSInteger)aMovementAmount projectileMaximum: (NSInteger)aProjectileMaximum projectileHealth: (NSInteger) aProjectileHealth;

@end
