//
//  BackgroundElement.m
//  ImmuniseThis
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "BackgroundElement.h"

static NSInteger counter = 0;

@implementation BackgroundElement

@synthesize identifier;

- (id) initWithTeam: (Team)aTeam health: (NSInteger)anHealthAmount {
	if (self = [super initWithTeam:aTeam health:anHealthAmount]) {
		hash = 0;
		identifier = counter++;
	} return self;
}

- (id) initWithTeam: (Team)aTeam health: (NSInteger)anHealthAmount identifier: (NSInteger)anIdentifier {
	if (self = [super initWithTeam:aTeam health:anHealthAmount]) {
		hash = 0;
		identifier = anIdentifier;
	} return self;
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;
	if (anObject != nil && [anObject isKindOfClass: [BackgroundElement class]]) {
		BackgroundElement *backgroundElement = (BackgroundElement *) anObject;
		if ([self identifier] == [backgroundElement identifier]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	if (hash < 1) {
		NSInteger newHash = 1;
		newHash *= 7 + [self identifier];
		hash = newHash;
	}
	return hash;
}

- (id) copyWithZone:(NSZone *)zone {
	BackgroundElement *backgroundElement = [[BackgroundElement alloc] initWithTeam:[self team] health:[self health] identifier:[self identifier]];
	return backgroundElement;
}

@end
