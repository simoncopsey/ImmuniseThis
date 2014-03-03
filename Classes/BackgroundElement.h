//
//  BackgroundElement.h
//  ImmuniseThis
//
//	Represents a background element of the arena.
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"


@interface BackgroundElement : Token <NSCopying> {
	NSInteger hash;
	NSInteger identifier;
}

/** unique identifier of background element to allow usage within a collection **/
@property (readonly) NSInteger identifier;

/** constructs a background element with the given configuration information **/
- (id) initWithTeam: (Team)aTeam health: (NSInteger)anHealthAmount;
- (id) initWithTeam: (Team)aTeam health: (NSInteger)anHealthAmount identifier: (NSInteger)anIdentifier;

@end
