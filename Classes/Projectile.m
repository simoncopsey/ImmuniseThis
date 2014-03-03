//
//  Projectile.m
//  ImmuniseThis
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Projectile.h"

static NSInteger counter = 0;

@implementation Projectile

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
	if (anObject != nil && [anObject isKindOfClass: [Projectile class]]) {
		Projectile *projectile = (Projectile *) anObject;
		if ([self identifier] == [projectile identifier]) {
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
	Projectile *projectile = [[Projectile alloc] initWithTeam:[self team] health:[self health] identifier:[self identifier]];
	return projectile;
}

@end
