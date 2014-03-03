//
//  SoundManager.h
//  ImmuniseThis
//
//	Loads and plays sounds based on events observed from the collision manager.
//
//  Created by Simon on 17/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//
//	References:
// http://www.members.tripod.com/~buggerluggs/ie/wav-dir184.htm (boing1.wav)
// http://soundbible.com/511-Squish-1.html (squish1.wav)
// http://soundbible.com/512-Squishy-2.html (squish2.wav)
// http://developer.apple.com/iphone/library/samplecode/SysSound/Introduction/Intro.html#//apple_ref/doc/uid/DTS40008018

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "CollisionHandler.h"
#import "Cell.h"
#import "Projectile.h"


@interface SoundManager : NSObject <CollisionHandler> {
	SystemSoundID	boingSound;
	SystemSoundID	squishOneSound;
	SystemSoundID	squishTwoSound;
}

@end