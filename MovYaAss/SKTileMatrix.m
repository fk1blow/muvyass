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

- (void)testFindTileForRect:(NSRect)rectToTest {
//    NSLog(@"desc %@", [[NSScreen mainScreen] deviceDescription]);
//    CGFloat x = [[NSScreen mainScreen] visibleFrame].origin.x;
//    CGFloat y = [[NSScreen mainScreen] visibleFrame].origin.y;
//    CGFloat width = [[NSScreen mainScreen] visibleFrame].size.width;
//    CGFloat height = [[NSScreen mainScreen] visibleFrame].size.height;
//    NSLog(@"main screen visible frame: %f, %f, %f, %f", x, y, width, height);
    
    
    /*for (NSValue *tile in tiles) {
        NSRect container = [tile rectValue];
        CGPoint pointToTest = rectToTest.origin;
        
        // test to see if the thing to test(a window, usually) point is inside one of the tiles
        if (CGRectContainsPoint(container, pointToTest)) {
            // check if the distance between the point and the containers upper margin
            // is more then a half of the thing to test's height
            CGFloat distanceTilUpperMargin = (container.origin.y + tileHeight) - pointToTest.y;
            NSLog(@"distance till current tile's upper margin: %f", distanceTilUpperMargin);
            CGFloat thingsHalf = rectToTest.size.height / 2;
            NSLog(@"things half: %f", thingsHalf);
            
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
//        NSLog(@"%f, %f", [tile rectValue].origin.x, [tile rectValue].origin.y);
    }*/
    
    int counter = 0;
    for(int i = 0; i < numberOfRows; i++) {
        for(int j = 0; j < numberOfColumns; j++, counter++) {
            NSRect container = [tiles[counter] rectValue];
            CGPoint pointToTest = rectToTest.origin;
            
            if (CGRectContainsPoint(container, pointToTest)) {
                CGFloat distanceTilUpperMargin = (container.origin.y + tileHeight) - pointToTest.y;
                CGFloat thingsHalf = rectToTest.size.height / 2;
                
                if (distanceTilUpperMargin > thingsHalf) {
                    NSLog (@"contains point!, %f, %f", container.origin.x, container.origin.y);
                }
                else {
                    //                NSRect upperContainer =
                    NSLog(@"tile not entirely there... select the upper tile");
                }
            }
//            NSRect tile = NSMakeRect(tileWidth * j, tileHeight * i, tileWidth, tileHeight);
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
