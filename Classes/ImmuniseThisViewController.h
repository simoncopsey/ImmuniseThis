//
//  ImmuniseThisViewController.h
//  ImmuniseThis
//
//	Thew view controller which initialises and starts the GameStateContext.
//
//  Created by Simon on 15/02/2010.
//  Copyright Simon Copsey 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vector.h"
#import "InteractionEvent.h"
#import "GameStateContext.h"
#import "Menu.h"
#import "Game.h"
#import "EndGame.h"


@interface ImmuniseThisViewController : UIViewController {
	@private
	Vector *touchDownLocation;
	GameStateContext *context;
}

@end

