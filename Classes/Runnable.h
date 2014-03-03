//
//  Runnable.h
//  ImmuniseThis
//
//	Represents an abstract task that may be pushed into a seperate Thread. Must be extended.
//
//  Created by Simon on 23/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Runnable : NSObject {
	@protected
	BOOL stop;
	NSAutoreleasePool *pool;
}

/* property that may be checked periodically by the Runnable to indicate suggested termination */
@property (assign) BOOL stop;

/* main run method, to be overridden */
- (void) run;

@end
