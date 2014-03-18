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
    int matrix [] = {rows, columns};
    CGRect frame = [[NSScreen mainScreen] visibleFrame];
    self = [self initWithTilesMatrix:matrix visibleFrame:frame];
    return self;
}

- (id) initWithTilesMatrix:(int [])matrix visibleFrame:(CGRect)frame {
    self = [super init];
    if ( self ) {
        numberOfRows = matrix[0];
        numberOfColumns = matrix[1];
        tileWidth = frame.size.width / numberOfColumns; // 840
        tileHeight = frame.size.height / numberOfRows; // 512
        tiles = [[NSMutableArray alloc] init];
        [self buildTilesMatrix];
    }
    return self;
}

#pragma mark Implementation

/**
* Builds the tiles matrix and adds every item to the tiles array
*/
- (void) buildTilesMatrix {
    for(int i = 0; i < numberOfRows; i++) {
        for(int j = 0; j < numberOfColumns; j++) {
            CGRect tile = CGRectMake(tileWidth * j, tileHeight * (i+1), tileWidth, tileHeight);
            [tiles addObject:[NSValue valueWithRect:tile]];
        }
    }
}

@end
