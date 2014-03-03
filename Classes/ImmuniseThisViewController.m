//
//  ImmuniseThisViewController.m
//  ImmuniseThis
//
//  Created by Simon on 15/02/2010.
//  Copyright Simon Copsey 2010. All rights reserved.
//

#import "ImmuniseThisViewController.h"

@implementation ImmuniseThisViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad {
	Arena *arena = [[[Arena alloc] initWithOrigin:[[Vector alloc] init] width:320 height:480 backgroundColour:[Colour blackColour] borderColour:[Colour redColour]] autorelease];
	context = [[GameStateContext alloc] initWithArena:arena];
	[[self view] addSubview:arena];
	[[[Menu alloc] initWithGameStateContext:context arena:arena] autorelease];
	[[[Game alloc] initWithGameStateContext:context arena:arena] autorelease];
	[[[EndGame alloc] initWithGameStateContext:context arena:arena] autorelease];
	[context run];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void) didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void) viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
	touchDownLocation = [[Vector alloc] initWithX:[touch locationInView:[self view]].x y:[touch locationInView:[self view]].y];	
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
	Vector *touchUpLocation = [[Vector alloc] initWithX:[touch locationInView:[self view]].x y:[touch locationInView:[self view]].y];
	InteractionEvent *interactionEvent = [[InteractionEvent alloc] initWithTouchDownLocation:touchDownLocation touchUpLocation:touchUpLocation];
	[context playerTouchWithInteraction:interactionEvent];
	[interactionEvent release];
}

- (void) dealloc {
    [super dealloc];
}

@end
