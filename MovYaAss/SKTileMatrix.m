//
// Created by Dragos on 2/18/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKTileMatrix.h"


@implementation SKTileMatrix {
    int numberOfRows;
    int numberOfColumns;
    // one tile height
    int tileHeight;
    // one tile width
    int tileWidth;
    // array of CGRect tiles
    NSArray* tiles;
}

- (id)initWithTilesMatrix:(int [])matrix andVisibleFrame:(CGRect)frame {
    self = [super init];
    if ( self ) {
        numberOfRows = matrix[0];
        numberOfColumns = matrix[1];
        tileWidth = [[NSScreen mainScreen] visibleFrame].size.width / numberOfColumns;
        tileHeight = [[NSScreen mainScreen] visibleFrame].size.height / numberOfRows;
        [self buildTilesFromMatrix];
    }
    return self;
}

- (void)buildTilesFromMatrix {
//    NSLog(@"%i", tileWidth);

    // for each row, create a column
    for(int i = 0; i < numberOfRows; i++) {
        for(int j = 0; j < numberOfColumns; j++) {
//            NSLog(@"x %i", tileWidth * y);
//            NSLog(@"y %i", tileHeight * (i+1));

            int x = i == 0 ? 0 : i;
            int y = j == 0 ? 0 : j;

            CGRect tile = CGRectMake(tileWidth * x, tileHeight * (i+1), tileWidth, tileHeight);
            NSLog(@"%d, %d", tile.origin.x, tile.origin.y);


//            CGPoint tileOrigin = CGPointMake(tileWidth * i, tileHeight * (y+1));
//            NSLog(@"%d, %d", tileOrigin.x, tileOrigin.y);
//            CGPoint tileOrigin = CGPointMake(tileHeight * (i+1), tileWidth * y);
//            NSLog(@"%i, %i", tileOrigin.x, tileOrigin.y);
//            NSLog(@"%i, %i", i, y);
//            int tilePoint = (i == 0) ? tileHeight : tileHeight * i+1;
//            NSLog(@"%d", tileHeight * i+1);
//            NSLog(@"%d", tileHeight * (i+1));
//            NSLog(@"%d", tilePoint);
//            CGRect tile = CGRectMake(tileHeight * i+1, <#(CGFloat)y#>, <#(CGFloat)width#>, <#(CGFloat)height#>)
        }
    }
}

@end
