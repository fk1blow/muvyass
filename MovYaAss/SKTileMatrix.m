//
// Created by Dragos on 2/18/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKTileMatrix.h"


@implementation SKTileMatrix {
    int numberOfRows;
    int numberOfColumns;
    CGFloat tileHeight;
    CGFloat tileWidth;
    NSMutableArray* tiles;
}

#pragma mark Initializers

- (id)initWithRows:(int)rows columns:(int)columns {
    CGRect frame = [[NSScreen mainScreen] visibleFrame];
    self = [self initWithRows:rows columns:columns visibleFrame:frame];
    return self;
}

#pragma mark Initializer: designated

- (id) initWithRows:(int)rows columns:(int)columns visibleFrame:(CGRect)frame {
    self = [super init];
    if ( self ) {
        numberOfRows = rows;
        numberOfColumns = columns;
        tileWidth = frame.size.width / rows; // 840
        tileHeight = frame.size.height / columns; // 512
        tiles = [[NSMutableArray alloc] init];
        [self buildTilesMatrix];
    }
    return self;
}

#pragma mark Test

/*
    Test to see if a tile's point is contained within a specific tile
    It also checks if the thingToTest should be included in that specific tile or
    if it needs to move to the next upper upper tile.
 
    The best way to determine is to build a detection test for both x and y axes
 */
- (void)testFindTileForRect:(NSRect)rectToTest {
    int i, j, counter = 0;
    
    CGPoint pointToTest = rectToTest.origin;
    CGFloat thingsHalf = rectToTest.size.height / 2;
    
    for(i = 0; i < numberOfRows; i++) {
        for(j = 0; j < numberOfColumns; j++, counter++) {
            NSRect container = [tiles[counter] rectValue];
            
            // test to see if the thing to test(a window, usually) point is inside one of the tiles
            if (CGRectContainsPoint(container, pointToTest)) {
                // check if the distance between the point and the containers upper margin
                // is more then a half of the thing to test's height
                CGFloat distanceTilUpperMargin = (container.origin.y + tileHeight) - pointToTest.y;
                
                // if it is, this is the tile we want, and should "break"
                if (distanceTilUpperMargin > thingsHalf) {
                    NSLog (@"contains point!, %f, %f", container.origin.x, container.origin.y);
                }
                // else, its logical to assume that the tile from the top is the target
                // we have found the tile we want, and should "break"
                else {
                    // and it should test if the upper tile is there - imagine the top most tile that
                    // it does not have an upper tile itsefl so it should be tested for this case
                    //                NSRect upperContainer =
                    NSLog(@"tile not entirely there... select the upper tile");
                }
            }
        }
    }
}

#pragma mark Implementation

/**
* Builds the tiles matrix and adds every item to the tiles array
*/
- (void) buildTilesMatrix {
    for(int i = 0; i < numberOfRows; i++) {
        for(int j = 0; j < numberOfColumns; j++) {
            NSRect tile = NSMakeRect(tileWidth * j, tileHeight * i, tileWidth, tileHeight);
            [tiles addObject:[NSValue valueWithRect:tile]];
        }
    }
}

@end
