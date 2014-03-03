//
//  CellView.h
//  ImmuniseThis
//
//	Represents the view of a generic Cell.
//
//  Created by Simon on 07/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>
#import "Vector.h"
#import "Colour.h"
#import "Movement.h"
#import "TokenView.h"
#import "ImageManager.h"

@class Movement; // TODO: Temporary fix

@interface CellView : TokenView <NSCopying> {
	@private
	NSString *name;
	NSInteger radius;
	Team team;
	NSInteger maximumHealth;
	NSInteger currentHealth;
	Movement *movement;
	UIImage *cellImage;
	ImageManager *imageManager;
}
// TODO: cell jumps on load
/** name of cell **/
@property (readonly, copy) NSString *name;
/** radius of cell **/
@property NSInteger radius;
/** maximum health of cell **/
@property (readonly) NSInteger maximumHealth;
/** current health of view **/
@property NSInteger currentHealth;
/** current movement of view **/
@property (copy) Movement *movement;

/** constructs a new instance with given configuration details with the origin at a given location **/
- (id) initWithName:(NSString *)aName origin:(Vector *)aLocation arena:(Arena *)anArena radius:(NSInteger)aRadius team:(Team)aTeam colour:(Colour *)aColour health:(NSInteger)anHealthAmount;
/** constructs a new instance with given configuration details centered at a given location **/
- (id) initWithName:(NSString *)aName centre:(Vector *)aLocation arena:(Arena *)anArena radius:(NSInteger)aRadius team:(Team)aTeam colour:(Colour *)aColour health:(NSInteger)anHealthAmount;

@end