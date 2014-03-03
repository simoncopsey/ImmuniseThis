//
//  Person.h
//  ImmuniseThis
//
//	Represents person / owner of a Cell. Envisaged use for multiplayer over network.
//
//  Created by Simon on 03/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	@private
	NSString *name;
	NSInteger identifier;
	NSInteger hash;
}

/** name of person **/
@property (readonly, copy) NSString *name;
/** unique identifier **/
@property (readonly) NSInteger identifier;

/** constructs a new instance with a given name, generates a unique identifier **/
- (id) initWithName: (NSString *)aName;
/** constructs a new instance with a given name and identifier **/
- (id) initWithName: (NSString *)aName identifier: (NSInteger) anIdentifier;

@end