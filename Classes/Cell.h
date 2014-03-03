//
//  Cell.h
//  ImmuniseThis
//
//	Represents the abstract model of a generic Cell.
//	This class should not be instantiated directly.
//
//  Created by Simon on 03/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Organelle.h"
#import "Token.h"

@interface Cell : Token <NSCopying> {
	@protected
	NSString *name;
	NSString *description;
	Person *owner;
	NSMutableArray *organelles;
	NSInteger healthRegenerationPerTick;
	NSInteger movementPerTick;
	NSInteger projectileMaximum;
	NSInteger projectileHealth;
}

/** name of cell **/
@property (readonly, copy) NSString *name;
/** description of cell **/
@property (readonly, copy) NSString *description;
/** owner of cell (for possible future multiplayer) **/
@property (readonly, copy) Person *owner;
/** organelles within cell - allowing addition of features as components **/
@property (readonly) NSMutableArray *organelles; // Organelle is Mutable, no need to copy
/** sum of health restored per game loop **/
@property (readonly) NSInteger healthRegenerationPerTick;
/** sum of maximum movement allowed per game loop **/
@property (readonly) NSInteger movementPerTick;
/** sum of maximum projectiles allowed in Arena at once **/
@property (readonly) NSInteger projectileMaximum;
/** sum of maximum projectile health **/
@property (readonly) NSInteger projectileHealth;

/** constructs a new instance with the given configuration details **/
- (id) initWithName: (NSString *)aName description: (NSString *)aDescription owner: (Person *)anOwner health: (NSInteger)aMaximumHealth team: (Team)aTeam;
/** adds an organelle (feature) to cell **/
- (void) addOrganelle: (Organelle *)anOrganelle;
/** returns the number of organelles currently added to cell **/
- (NSInteger) organelleCount;
/** returns the organelle at a specific offset **/
- (Organelle *) organelleAtIndex: (NSInteger)anIndex;
/** removes a specific organelle **/
- (void) removeOrganelleIdenticalTo: (Organelle *)anOrganelle;
/** removes an organelle at a specific offset **/
- (Organelle *) removeOrganelleAtIndex: (NSInteger)anIndex;

@end