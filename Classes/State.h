//
//  State.h
//  ImmuniseThis
//
//	Simple enumerations used for holding state information.
//
//  Created by Simon on 11/04/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

/** state enum, used by TimerTask for example **/
typedef enum {
	kNew,
	kRunning,
	kPaused,
	kStopped
} State;

/** visibility enum, used by various views, for example **/
typedef enum {
	kHidden,
	kVisible
} Visibility;