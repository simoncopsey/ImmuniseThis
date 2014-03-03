//
//  CellViewTest.h
//  ImmuniseThis
//
//  Created by Simon on 07/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "CellView.h"
#import "Colour.h"


@interface CellViewTest : SenTestCase {
	@private
	CellView *fixture;
	Arena *arena;
}

- (void) testInit;
- (void) testInitWithName;

@end
