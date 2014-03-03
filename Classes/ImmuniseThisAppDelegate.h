//
//  ImmuniseThisAppDelegate.h
//  ImmuniseThis
//
//	Application delegate, where the fun begins.
//
//  Created by Simon on 15/02/2010.
//  Copyright Simon Copsey 2010. All rights reserved.
//
//	References:
// https://developer.apple.com/iphone/prerelease/library/documentation/Audio/Conceptual/iPodLibraryAccess_Guide/AboutiPodLibraryAccess/AboutiPodLibraryAccess.html

#import <UIKit/UIKit.h>

@class ImmuniseThisViewController;

@interface ImmuniseThisAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImmuniseThisViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImmuniseThisViewController *viewController;

@end

