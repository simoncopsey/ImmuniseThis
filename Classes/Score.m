//
//  Score.m
//  ImmuniseThis
//
//  Created by Simon on 17/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Score.h"


@implementation Score

@synthesize score;

- (id) init {
	if (self = [super init]) {
		score = 0;
	} return self;
}

@end
