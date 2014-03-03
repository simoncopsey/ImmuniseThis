//
//  Token.m
//  ImmuniseThis
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Token.h"


@implementation Token

@synthesize team;
@synthesize health;

- (id) init {
	if (self = [super init]) {
		[self initWithTeam:kFriendly health:100];
	} return self;
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;
	if (anObject != nil && [anObject isKindOfClass: [Token class]]) {
		Token *token = (Token *) anObject;
		if ([self team] == [token team] && [self health] == [token health]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	NSInteger hash = 1;
	hash *= 7 + [self team];
	hash *= 7 + [self health];
	return hash;
}

- (id) initWithTeam: (Team)aTeam health: (NSInteger)anHealthAmount {
	if (anHealthAmount <= 0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anHealthAmount must be greater than 0"];
	}
	if (self = [super init]) {
		health = anHealthAmount;
		team = aTeam;
	} return self;
}

- (id) copyWithZone:(NSZone *)zone {
	Token *token = [[Token alloc] initWithTeam:[self team] health:[self health]];
	return token;
}


@end