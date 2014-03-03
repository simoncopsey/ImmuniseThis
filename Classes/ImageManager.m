//
//  ImageManager.m
//  ImmuniseThis
//
//  Created by Simon on 18/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "ImageManager.h"

// TODO: not the best implementation of an image manager
// TODO: singleton?
@implementation ImageManager

- (id) init {
	if (self = [super init]) {
		imageDictionary = [[NSMutableDictionary alloc] init];
		NSString *friendlyFile = [[NSBundle mainBundle] pathForResource:@"friendly" ofType:@"png"];
		UIImage *friendlyImage = [[UIImage alloc] initWithContentsOfFile:friendlyFile];
		[imageDictionary setObject:friendlyImage forKey:@"friendly"];
		NSString *enemyFile = [[NSBundle mainBundle] pathForResource:@"enemy" ofType:@"png"];
		UIImage *enemyImage = [[UIImage alloc] initWithContentsOfFile:enemyFile];
		[imageDictionary setObject:enemyImage forKey:@"enemy"];
	} return self;
}

- (UIImage *) imageForName: (NSString *)aName {
	if (aName == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aName may not be nil"];
	}
	return [[[imageDictionary objectForKey:aName] retain] autorelease];
}

@end