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
    self = [self initWithRows:rows columns:columns  visibleFrame:frame];
    return self;
}

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

#pragma mark Implementation

- (void)testTileRecognition {
    NSLog(@"%@", NSWindow windo);
}

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
