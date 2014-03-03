//
//  MenuItem.h
//  ImmuniseThis
//
//	Represents the data behind a menu item.
//
//  Created by Simon on 07/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MenuItem : NSObject {
	@private
	NSString *name;
}

/** name / label of menu item **/
@property (readonly, copy) NSString *name;

/** constructs a new instance with a given name **/
- (id) initWithName: (NSString *)aName;

@end
