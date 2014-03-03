//
//  CellView.m
//  ImmuniseThis
//
//  Created by Simon on 07/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "CellView.h"


@implementation CellView

@synthesize name;
@synthesize maximumHealth;
@synthesize currentHealth;
@synthesize movement;

// TODO: disable default constructor
/*
- (id) init {
	[NSException raise:NSInternalInconsistencyException format:@"Argument aName may not be nil"];
	return nil;
}
*/


- (id) initWithName:(NSString *)aName origin:(Vector *)aLocation arena:(Arena *)anArena radius:(NSInteger)aRadius team:(Team)aTeam colour:(Colour *)aColour health:(NSInteger)anHealthAmount {
	return [self initWithName:aName centre:[[[Vector alloc] initWithX:([aLocation x] + aRadius) y:([aLocation y] + aRadius)] autorelease] arena:anArena radius:aRadius team:aTeam colour:aColour health:anHealthAmount];
}

- (id) initWithName:(NSString *)aName centre:(Vector *)aLocation arena:(Arena *)anArena radius:(NSInteger)aRadius team:(Team)aTeam colour:(Colour *)aColour health:(NSInteger)anHealthAmount {
	if (aName == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aName may not be nil"];
	}
	if (anHealthAmount < 1) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument anHealthAmount must be greater than 0"];
	}
	if (aRadius <= 0.0) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aRadius must be greater than 0"];
	}	
	if (self = [super initWithOrigin:aLocation arena:anArena width:(aRadius * 2) height:(aRadius * 2) colour:aColour]) {
		name = [[NSString stringWithString:aName] retain];
		radius = aRadius;
		team = aTeam;
		maximumHealth = anHealthAmount;
		currentHealth = anHealthAmount;
 		movement = [[Movement alloc] initWithDirection:0 speed:0];
		imageManager = [[ImageManager alloc] init];
		if (aTeam == kFriendly) {
			cellImage = [imageManager imageForName:@"friendly"];
		} else {
			cellImage = [imageManager imageForName:@"enemy"];
		}
	} return self;
}

- (BOOL) isEqual: (id)anObject {
	BOOL equal = NO;	
	if (anObject != nil && [anObject isKindOfClass: [CellView class]]) {
		CellView *cellview = (CellView *) anObject;
		if ([[self name] isEqual:[cellview name]] && [[self colour] isEqual:[cellview colour]] && [self radius] == [cellview radius]
			&& [self maximumHealth] == [cellview maximumHealth]) {
			equal = YES;
		}
	}
	return equal;
}

- (NSUInteger) hash {
	NSInteger hash = 1;
	hash *= 7 + [[self name] hash];
	hash *= 7 + [[self colour] hash];;
	hash *= 7 + [self radius];
	hash *= 7 + [self maximumHealth];
	return hash;
}

- (id) copyWithZone:(NSZone *)zone {
	CellView *cellView = [[CellView alloc] initWithName:[self name] centre:[[[self location] copyWithZone:nil] autorelease] arena:arena radius:[self radius] team:team colour:[[[self colour] copyWithZone:nil] autorelease] health:[self maximumHealth]];
	[cellView setMovement:[[Movement alloc] initWithDirection:[[self movement] direction] speed:[[self movement] speed]]];
	[cellView setCurrentHealth:[self currentHealth]];
	[cellView setRawVisibility:visibility];
	return cellView;
}

- (NSInteger) radius {
	NSInteger value = 0;
	@synchronized(self) {
		value = radius;
	}
	return value;
}

- (void) setRadius:(NSInteger)aRadius {
	@synchronized(self) {
		radius = aRadius;
		[self setNeedsDisplay];
	}
}

- (void) drawRect:(CGRect)rect {
//	CGContextRef context = UIGraphicsGetCurrentContext();
	CGRect frame = CGRectMake(rect.origin.x, rect.origin.y, radius * 2, radius * 2);
//	UIColor *color = [[self colour] UIColor];
//	CGContextSetStrokeColorWithColor(context, [color CGColor]);
// 	CGContextAddEllipseInRect(context, frame);
//	CGContextDrawPath(context, kCGPathStroke);
	[cellImage drawInRect:frame];
	self.backgroundColor = [UIColor clearColor];
}


- (void) dealloc {
	[name release];
	[movement release];
	[imageManager release];
	[super dealloc];
}

@end