//
//  Token.h
//  ImmuniseThis
//
//	Represents an distinct entity that may interact with other entities.
//
//  Created by Simon on 13/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	kEnemy,
	kFriendly
} Team;

@interface Token : NSObject <NSCopying> {
	@protected
	Team team;
	NSInteger health;
}

/** team of token (used to distinguish between opponent / enemy and friendly cells) **/
@property (readonly) Team team;
/** health points of token **/
@property NSInteger health;

/** constructs a token with the given team and health amount **/
- (id) initWithTeam: (Team)aTeam health: (NSInteger)anHealthAmount;

@end
