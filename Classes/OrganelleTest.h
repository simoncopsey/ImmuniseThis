//
//  OrganelleTest.h
//  ImmuniseThis
//
//  Created by Simon on 04/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "Organelle.h"

@interface OrganelleTest : SenTestCase {
	@private
	Organelle *fixture;
}

- (void) testInitWithName;
- (void) testInit;
// - (void) testIsEqual;

@end