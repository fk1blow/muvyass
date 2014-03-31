//
// Created by Dragos on 2/18/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SKTileMatrix : NSObject

// the invisible frame for the tiles wrapper rect
@property (nonatomic, assign) CGRect wrapperFrame;


- (id) initWithRows:(int)rows
            columns:(int)columns;

- (id) initWithRows:(int)rows
            columns:(int)columns
       visibleFrame:(CGRect)frame;


// finds the tile where this rectangle is located
- (NSRect) tileForRectangle:(NSRect)rect;

// finds the tile where this rectangle is located testing its containment for a particular axis
// It tests the containment(intersection) over the x or y axis, deciding between two tiles on the
// x or two tiles on the y(if the current tile is not fully contained, it selects the upper/right-er
// tile, meaning that that's the tile containing the rect)
- (NSRect) tileForRectangle:(NSRect)rect
             relativeToAxis:(NSString *)axis;

// @todo remove testFindTileForRect: temporary method
- (void)testFindTileForRect:(NSRect)frame;

@end
