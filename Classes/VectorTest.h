//
//  VectorTest.h
//  ImmuniseThis
//
//  Created by Simon on 17/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#include <math.h>
#import "Vector.h"


@interface VectorTest : SenTestCase {
	@private
	Vector *fixture;
}

- (void)testIsEqual;
- (void)testDistanceTo;
- (void)testCopyWithZone;
- (void)testAngleToInRadians;
- (void)testAngleToInDegrees;

@end