//
//  InteractionEvent.h
//  ImmuniseThis
//
//	Represents a simplistic holder for an interaction / touch event.
//	Only takes into account the first and last touch locations.
//
//  Created by Simon on 17/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Vector.h"


@interface InteractionEvent : NSObject {
	@private
	Vector *touchDownLocation;
	Vector *touchUpLocation;
	double touchDistance;
	double touchDirectionInRadians;
	bool isSingleTap;
	// TODO: add temporal information?
}

/** location which user started screen touch **/
@property (readonly, copy) Vector *touchDownLocation;
/** location which user finished screen touch **/
@property (readonly, copy) Vector *touchUpLocation;
/** distance between start and finish touch locations **/
@property (readonly) double touchDistance;
/** angle from start to finish touch locations **/
@property (readonly) double touchDirectionInRadians;
/** was the tap a single touch? **/
// TODO: requires threshold
@property (readonly) bool isSingleTap;

/** constructs an InteractionEvent instance with the given locations **/
- (id) initWithTouchDownLocation: (Vector *)aTouchDownLocation touchUpLocation: (Vector *)aTouchUpLocation;

@end
