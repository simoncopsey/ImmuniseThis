//
//  CellController.h
//  ImmuniseThis
//
//	Represents a generic cell controller. Forms the basis of the Player and Computer cells.
//
//  Created by Simon on 15/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellView.h"
#import "TextView.h"
#import "Cell.h"
#import "TokenController.h"
#import "Vector.h"
#import "Colour.h"
#import "CellConfiguration.h"
#import "Arena.h"
#import "ProjectileDispenser.h"


@class CellView; // TODO: temporary fix
@class TextView;
@class ProjectileDispenser;

@interface CellController : TokenController <CollisionHandler> {	
	@protected
	CellView *cellView;
	TextView *textView;
	Cell *model;
	ProjectileDispenser *projectileDispenser;
}

/** model **/
@property (readonly) Cell *model;
/** view of the main cell **/
@property (readonly) CellView *cellView;
/** view of the caption (showing name and health information) **/
@property (readonly) TextView *textView;

/** constructs an instance with the given model and arena **/
- (id) initWithModel: (Cell *)aModel arena: (Arena *)anArena;
/** constructs an instance with the given model, arena and cell configuration **/
- (id) initWithModel: (Cell *)aModel arena: (Arena *)anArena configuration: (CellConfiguration *)aCellConfiguration;

@end
