//
//  SoundManager.m
//  ImmuniseThis
//
//  Created by Simon on 17/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "SoundManager.h"
#include <AudioToolbox/AudioToolbox.h>


@implementation SoundManager

// TODO: singleton
- (id) init {
	if (self = [super init]) {
		CFBundleRef mainBundle = CFBundleGetMainBundle();
		CFURLRef boingSoundFile = CFBundleCopyResourceURL (mainBundle, CFSTR ("boing"), CFSTR ("wav"), NULL);
		CFURLRef squishOneSoundFile = CFBundleCopyResourceURL (mainBundle, CFSTR ("squish1"), CFSTR ("wav"), NULL);
		CFURLRef squishTwoSoundFile = CFBundleCopyResourceURL (mainBundle, CFSTR ("squish2"), CFSTR ("wav"), NULL);
		AudioServicesCreateSystemSoundID (boingSoundFile, &boingSound);
		AudioServicesCreateSystemSoundID (squishOneSoundFile, &squishOneSound);
		AudioServicesCreateSystemSoundID (squishTwoSoundFile, &squishTwoSound);
	} return self;
}

- (void) collisionOfToken: (Token *)aFirstToken withToken: (Token *)aSecondToken {
	if ([aFirstToken isKindOfClass: [Cell class]] && [aSecondToken isKindOfClass:[Projectile class]]) {
		if ([aFirstToken team] != [aSecondToken team]) {
			AudioServicesPlayAlertSound (squishOneSound);
		}
	} /* else if ([aFirstToken isKindOfClass: [Cell class]] && [aSecondToken isKindOfClass:[Cell class]]) {
		if ([aFirstToken team] == kFriendly && [aSecondToken team] == kEnemy) {
			AudioServicesPlayAlertSound (squishTwoSound);
		}
	}*/
}

- (void) collisionWithArenaBoundsOfToken:(Token *)aToken {
	AudioServicesPlayAlertSound (boingSound);
}

@end