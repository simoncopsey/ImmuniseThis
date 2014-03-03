//
//  Person.m
//  ImmuniseThis
//
//  Created by Simon on 03/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize name;
@synthesize identifier;

- (id) init {
	if (self = [super init]) {
		[self initWithName:nil];
	} return self;
}

- (id) initWithName: (NSString *)aName {
	if (self = [super init]) {
		[self initWithName: aName identifier: arc4random() % 1048576];
	} return self;
}

- (id) initWithName: (NSString *)aName identifier: (NSInteger)anIdentifier {
	if (aName == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aName may not be nil"];
	}
	if (self = [super init]) {
		hash = 0;
		name = [[NSString stringWithString: aName] retain];
		identifier = anIdentifier;
	} return self;
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;
	if (anObject != nil && [anObject isKindOfClass: [Person class]]) {
		Person *person = (Person *) anObject;
		if ([[self name] isEqual:[person name]] && [self identifier] == [person identifier]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	if (hash < 1) {
		NSInteger newHash = 1;
 		newHash *= 7 + [[self name] hash];
		newHash *= 7 + [self identifier];
		hash = newHash;
	}
	return hash;
}

- (void) dealloc {
	[name release];
	[super dealloc];
}

@end