//
//  CellTest.h
//  ImmuniseThis
//
//  Created by Simon on 03/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "Cell.h"
#import "Person.h"

@interface CellTest : SenTestCase {
	@private
	Cell *fixture;
}

- (void) testInitWithName;
- (void) testInit;
- (void) testOrganelleCount;
- (void) testOrganelleAtIndex;
- (void) testRemoveOrganelle;
- (void) testRemoveOrganelleAtIndex;
- (void) testIsEqual;

@end
