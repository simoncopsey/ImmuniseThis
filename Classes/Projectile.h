//
//  Projectile.h
//  ImmuniseThis
//
//	Represents a projectile dispensed by a Token.
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"


@interface Projectile : Token <NSCopying> {
	NSInteger hash;
	NSInteger identifier;
}
/** unique identifier of background element to allow usage within a collection **/
@property (readonly) NSInteger identifier;

/** constructs a new instance with the given configuration details **/
- (id) initWithTeam: (Team)aTeam health: (NSInteger)anHealthAmount;
/** constructs a new instance with the given configuration details, specifying an identifier **/
- (id) initWithTeam: (Team)aTeam health: (NSInteger)anHealthAmount identifier: (NSInteger)anIdentifier;

@end
