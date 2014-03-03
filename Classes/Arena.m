//
//  Arena.m
//  ImmuniseThis
//
//  Created by Simon on 10/02/2010.
//  Copyright 2010 Simon Copsey. All rights reserved.
//

#import "Arena.h"


@implementation Arena

@synthesize height;
@synthesize width;
@synthesize backgroundColour;
@synthesize borderColour;
@synthesize cells;
@synthesize projectiles;
@synthesize backgroundElements;
@synthesize collisionManager;
@synthesize eventManager;

- (id) init {
	return [self initWithOrigin:[[Vector alloc] init] width:320 height:480 backgroundColour:[Colour blackColour] borderColour: [Colour redColour]];
}

- (id) initWithOrigin:(Vector *)anOrigin width: (NSInteger)aWidth height: (NSInteger)aHeight backgroundColour: (Colour *)aBackgroundColour borderColour: (Colour *)aBorderColour {
	if (self = [super initWithFrame:CGRectMake([anOrigin x], [anOrigin y], aWidth, aHeight)]) {
		origin = [anOrigin copyWithZone:nil];
		height = aHeight;
		width = aWidth;
		if (backgroundColour != nil) {
			backgroundColour = [aBackgroundColour copyWithZone:nil];
		} else {
			backgroundColour = [[Colour blackColour] retain];
		}
		if (borderColour) {
			borderColour = [aBorderColour copyWithZone:nil];
		} else {
			borderColour = [[Colour redColour] retain];
		}
		cells = [[NSMutableSet alloc] init];
		projectiles = [[NSMutableSet alloc] init];
		backgroundElements = [[NSMutableSet alloc] init];
		cellModelsToViews = [[NSMutableDictionary alloc] init];
		projectileModelsToViews = [[NSMutableDictionary alloc] init];
		backgroundElementModelsToViews = [[NSMutableDictionary alloc] init];
		collisionManager = [[CollisionManager alloc] initWithArena:self];
		[collisionManager startWithInterval:0.1];
		soundManager = [[SoundManager alloc] init];
		[collisionManager registerObserver:soundManager];
		eventManager = [[EventManager alloc] initWithArena:self];
	} return self;
}

- (void) drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, [[[self backgroundColour] UIColor] CGColor]);
	CGContextSetStrokeColorWithColor(context, [[[self borderColour] UIColor] CGColor]);
	CGContextAddRect(context, rect);
	CGContextDrawPath(context, kCGPathFillStroke);	
}

- (void) updateCellViewWithModel: (Cell *)aModel view: (CellView *)aView {
	@synchronized(self) {
		if (aModel != nil && aView != nil) {
			[cells addObject: aModel];
			[cellModelsToViews removeObjectForKey:[aModel retain]];
			[cellModelsToViews setObject:aView forKey:aModel];
			[aModel release];
		}
	}
}

- (void) updateProjectileViewWithModel: (Projectile *)aModel view: (ProjectileView *)aView {
	@synchronized(self) {
		if (aModel != nil && aView != nil) {
			[projectiles addObject: aModel];
			[projectileModelsToViews removeObjectForKey:[aModel retain]];
			[projectileModelsToViews setObject:aView forKey:aModel];
			[aModel release];
		}
	}
}

- (void) updateBackgroundElementViewWithModel: (BackgroundElement *)aModel view: (BackgroundElementView *)aView {
	@synchronized(self) {
		if (aModel != nil && aView != nil) {
			[backgroundElements addObject: aModel];
			[backgroundElementModelsToViews removeObjectForKey:[aModel retain]];
			[backgroundElementModelsToViews setObject:aView forKey:aModel];
			[aModel release];
		}
	}
}

- (CellView *) getViewOfCellWithModel: (Cell *)aModel {
	if (aModel == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aModel may not be nil"];
	}
	CellView *cellView = nil;
	@synchronized(self) {
		cellView = [[cellModelsToViews objectForKey:aModel] copyWithZone:nil];
	}
	return [cellView autorelease];
}

- (BackgroundElementView *) getViewOfBackgroundElementWithModel: (BackgroundElement *)aModel {
	if (aModel == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aModel may not be nil"];
	}
	BackgroundElementView *backgroundElementView = nil;
	@synchronized(self) {
		backgroundElementView = [[backgroundElementModelsToViews objectForKey:aModel] copyWithZone:nil];
	}
	return [backgroundElementView autorelease];
}

- (ProjectileView *) getViewOfProjectileWithModel: (Projectile *)aModel {
	if (aModel == nil) {
		[NSException raise:NSInternalInconsistencyException format:@"Argument aModel may not be nil"];
	}
	ProjectileView *projectileView = nil;
	@synchronized(self) {
		projectileView = [[projectileModelsToViews objectForKey:aModel] copyWithZone:nil];
	}
	return [projectileView autorelease];
}

// TODO: why is this getting called by the menu before the game starts?
- (NSArray *) getModelsOfCellWithTeam: (Team)aTeam {
	// TODO: more efficient method for doing this? Dictionary doesn't seem to work with enums.
	NSMutableArray *cellArray = [[NSMutableArray alloc] init];
	@synchronized(self) {
		for (Cell *cell in cells) {
			if ([cell team] == aTeam) {
				[cellArray addObject:cell];
			}
		}
	}
	return [[[NSArray alloc] initWithArray:cellArray] autorelease];
}

- (void) dealloc {
	[origin release];
	[backgroundColour release];
	[borderColour release];
	[cells release];
	[cellModelsToViews release];
	[super dealloc];
}

@end