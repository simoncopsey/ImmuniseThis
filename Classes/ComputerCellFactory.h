//
//  ComputerCellFactory.h
//  ImmuniseThis
//
//	Acts as a computer cell 'factory' which also manages the lifetime of the cells.
//
//  Created by Simon on 19/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Arena.h"
#import "CellConfiguration.h"

@class ComputerCellController; // TODO: temporary fix
@class Arena;


@interface ComputerCellFactory : NSObject <EventHandler> {
	Arena *arena;
	NSMutableDictionary *cellModelsToControllers;
	NSInteger nextHealth;
	NSInteger nextRadius;
}

/** Returns an instance of a ComputerCellController which is managed, e.g.: to allow 'respawning' **/
- (ComputerCellController *) getComputerCell;

@end