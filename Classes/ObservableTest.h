//
//  ObservableTest.h
//  ImmuniseThis
//
//  Created by Simon on 06/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "Observable.h"
#import "Observer.h"

@interface ObservableTest : SenTestCase <Observer> {
	@private
	Observable *fixture;
	NSInteger updateCounter;
	Event *lastEvent;
}

- (void)testRegisterObserver;
- (void)testRemoveObserver;
- (void)testRemoveAllObservers;
- (void)testNotifyObservers;

@end
