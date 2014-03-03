//
//  Vector.m
//  ImmuniseThis
//
//  Created by Simon on 15/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Vector.h"

@implementation Vector

@synthesize x;
@synthesize y;

- (id) init {
	if (self = [super init]) {
		[self initWithX:0 y:0];
	} return self;
}

- (id) initWithX: (double)anXCoordinate y: (double)aYCoordinate {
	if (self = [super init]) {
		hash = 0;
		x = anXCoordinate;
		y = aYCoordinate;
	} return self;
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;
	if (anObject != nil && [anObject isKindOfClass: [Vector class]]) {
		Vector *vector = (Vector *) anObject;
		if ([self x] == [vector x] && [self y] == [vector y]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	if (hash < 1) {
		NSInteger newHash = 1;
		newHash *= 7 + [self x];
		newHash *= 7 + [self y];
		hash = newHash;
	}
	return hash;
}

- (id) copyWithZone:(NSZone *)zone {
	Vector *vector = [[Vector alloc] initWithX:[self x] y:[self y]];
	// return [vector autorelease];
	return vector;
}

- (double) distanceTo: (Vector *)aVector {
	if (aVector == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aVector may not be nil"];
	}
	double distance = sqrt(pow((x - aVector.x), 2) + pow((y - aVector.y), 2));
	return distance;
}

- (double) angleToInRadians: (Vector *)aVector {
	if (aVector == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aVector may not be nil"];
	}
	if ([self isEqual:aVector]) {
		[NSException raise:NSInternalInconsistencyException format:@"Impossible to calculate the relative angle between two identical vectors"];
	}	
	double rise = [aVector y] - y;
	double run = [aVector x] - x;
	double angle = [self makePositive:(rise / run)];
	angle = atan(angle);
	if (rise < 0 && run > 0) {
		angle = - angle;
	} else if (rise > 0 && run < 0) {
		angle = M_PI - angle;
	} else if (rise < 0 && run < 0) {
		angle = - (M_PI - angle);
	}
	return angle;
}

- (double) angleToInDegrees: (Vector *)aVector {
	if (aVector == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aVector may not be nil"];
	}
	double angle = [self angleToInRadians:aVector];
	return angle * 180 / M_PI;
}

// TODO: private method
- (double) makePositive: (double)aValue {
	if (aValue < 0) {
		return - aValue;
	} else {
		return aValue;
	}
}

- (void) dealloc {
	[super dealloc];
}

@end