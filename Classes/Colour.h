//
//  Colour.h
//  ImmuniseThis
//
//	Represents an RGB colour.
//
//  Created by Simon on 23/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>


@interface Colour : NSObject <NSCopying> {
	@private
	double alpha;
	double red;
	double green;
	double blue;
	NSInteger hash;
}

/** alpha value **/
@property (readonly) double alpha;
/** red value **/
@property (readonly) double red;
/** green value **/
@property (readonly) double green;
/** blue value **/
@property (readonly) double blue;

/** convenience factory method for returning a colour with black RGB */
+ (Colour *)blackColour;
/** convenience factory method for returning a colour with white RGB */
+ (Colour *)whiteColour;
/** convenience factory method for returning a colour with red RGB */
+ (Colour *)redColour;
/** convenience factory method for returning a colour with green RGB */
+ (Colour *)greenColour;
/** convenience factory method for returning a colour with blue RGB */
+ (Colour *)blueColour;

/** constructs a new Colour instance with the given colour/alpha parameters */
- (id) initWithAlpha: (double)anAlphaAmount red:(double)aRedAmount green:(double)aGreenAmount blue:(double)aBlueAmount;
/** returns the associated UIColor counterpart */
- (UIColor *) UIColor;

@end