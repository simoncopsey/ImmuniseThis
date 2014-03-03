//
//  ColourTest.h
//  ImmuniseThis
//
//  Created by Simon on 23/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "Colour.h"


@interface ColourTest : SenTestCase {
	@private
	Colour *fixture;
}

- (void) testInitWithRedGreenBlue;
- (void) testEquals;

@end
