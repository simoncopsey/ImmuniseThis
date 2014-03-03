//
//  ImageManager.h
//  ImmuniseThis
//
//	Represents a manager for holding references to image data.
//
//  Created by Simon on 18/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>


@interface ImageManager : NSObject {
	NSMutableDictionary *imageDictionary;
}

/** returns an image with the given key/name **/
- (UIImage *) imageForName: (NSString *)aName;

@end
