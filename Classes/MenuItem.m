//
//  MenuItem.m
//  ImmuniseThis
//
//  Created by Simon on 07/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "MenuItem.h"


@implementation MenuItem

@synthesize name;

- (id) init {
	if (self = [super init]) {
		[self initWithName:nil];
	} return self;
}

- (id) initWithName: (NSString *)aName {
	if (aName == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aName may not be nil"];
	}
	if (self = [super init]) {
		name = [[NSString stringWithString:aName] retain];
	} return self;
}

@end
