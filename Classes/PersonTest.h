//
//  PersonTest.h
//  ImmuniseThis
//
//  Created by Simon on 04/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonTest : SenTestCase {
	@private
	Person *fixture;
}

- (void) testInitWithName;
- (void) testInitWithNameAndIdentifier;
- (void) testInit;
- (void) testIsEqual;

@end
