//
//  Arena.h
//  ImmuniseThis
//
//	Represents the physical game world and the Cells within.
//
//  Created by Simon on 10/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import "Vector.h"
#import "Cell.h"
#import "CellView.h"
#import "CollisionManager.h"
#import "ProjectileView.h"
#import "Projectile.h"
#import "BackgroundElement.h"
#import "BackgroundElementView.h"
#import "SoundManager.h"
#import "EventManager.h"


@class CellView; // TODO: Temporary fix
@class Cell;
@class CollisionManager;
@class BackgroundElementView;
@class ProjectileView;
@class ProjectileController;
@class EventManager;

@interface Arena : UIView {
	@private
	Vector *origin;
	NSInteger height;
	NSInteger width;
	Colour *backgroundColour;
	Colour *borderColour;
	NSMutableSet *cells;
	NSMutableSet *projectiles;
	NSMutableSet *backgroundElements;
	NSMutableDictionary *cellModelsToViews;
	NSMutableDictionary *projectileModelsToViews;
	NSMutableDictionary *backgroundElementModelsToViews;
	NSMutableDictionary *projectileModelsToControllers;
	CollisionManager *collisionManager;
	SoundManager *soundManager;
	EventManager *eventManager;
}

/** height of arena (view area) **/
@property (readonly) NSInteger height;
/** width of arena **/
@property (readonly) NSInteger width;
// TODO: mixing view and model
/** background colour of arena **/
@property (readonly, copy) Colour *backgroundColour;
/** border colour of arena **/
@property (readonly, copy) Colour *borderColour;
/** cells within arena **/
@property (readonly, copy) NSSet *cells;
/** projectiles within arena **/
@property (readonly, copy) NSSet *projectiles;
/** background elements shown within arena **/
@property (readonly, copy) NSSet *backgroundElements;
/** collision manager for notifying classes about collisions **/
@property (readonly, retain) CollisionManager *collisionManager;
/** event manager for notifying classes about other events **/
@property (readonly, retain) EventManager *eventManager;

/** constructs an Arena instance with the given configuration details **/
- (id) initWithOrigin:(Vector *)anOrigin width: (NSInteger)aWidth height: (NSInteger)aHeight backgroundColour: (Colour *)aBackgroundColour borderColour: (Colour *)aBorderColour;
/** updates the location of a cell view within the arena, using the model as a key **/
- (void) updateCellViewWithModel: (Cell *)aModel view: (CellView *)aView;
/** updates the location of a projectile view within the arena, using the model as a key **/
- (void) updateProjectileViewWithModel: (Projectile *)aModel view: (ProjectileView *)aView;
/** updates the location of a background element view within the arena, using the model as a key **/
- (void) updateBackgroundElementViewWithModel: (BackgroundElement *)aModel view: (BackgroundElementView *)aView;
/** returns the view of a cell within the arena, using the model as a key **/
- (CellView *) getViewOfCellWithModel: (Cell *)aModel;
/** returns the view of a background element within the arena, using the model as a key **/
- (BackgroundElementView *) getViewOfBackgroundElementWithModel: (BackgroundElement *)aModel;
/** returns the view of a projectile within the arena, using the model as a key **/
- (ProjectileView *) getViewOfProjectileWithModel: (Projectile *)aModel;
/** returns all cell models within the arena that belong to the given team **/
- (NSArray *) getModelsOfCellWithTeam: (Team)aTeam;

@end