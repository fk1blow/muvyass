//
// Created by Dragos on 2/18/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKTileMatrix.h"


@implementation SKTileMatrix {
    int numberOfRows;
    int numberOfColumns;
    // one tile height
    CGFloat tileHeight;
    // one tile width
    CGFloat tileWidth;
    // array of CGRect tiles
    NSMutableArray* tiles;
}

- (id)initWithRows:(int)rows andColumns:(int)columns {
    int matrix [] = {rows, columns};
    CGRect frame = [[NSScreen mainScreen] visibleFrame];
    self = [self initWithTilesMatrix:matrix andVisibleFrame:frame];
    return self;
}

- (id) initWithTilesMatrix:(int [])matrix andVisibleFrame:(CGRect)frame {
    self = [super init];
    if ( self ) {
        numberOfRows = matrix[0];
        numberOfColumns = matrix[1];
        tileWidth = frame.size.width / numberOfColumns; // 840
        tileHeight = frame.size.height / numberOfRows; // 512
        tiles = [[NSMutableArray alloc] init];
        [self buildTilesFromMatrix];
    }
    //[tiles addObject:@"s"];
    //[tiles addObject:@"b"];
    NSLog(@"%@", tiles);
    return self;
}

/**
* Builds the tiles matrix and adds every item to the tiles array
*/
- (void) buildTilesFromMatrix {
    for(int i = 0; i < numberOfRows; i++) {
        for(int j = 0; j < numberOfColumns; j++) {
            CGRect tile = CGRectMake(tileWidth * j, tileHeight * (i+1), tileWidth, tileHeight);
            [tiles addObject:[NSValue valueWithRect:tile]];
        }
    }
}

@end
