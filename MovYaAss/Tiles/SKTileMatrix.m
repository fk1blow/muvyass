//
// Created by Dragos on 2/18/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKTileMatrix.h"


@implementation SKTileMatrix {
    // currently used tile matrix array as rows x columns
    int matrixConfiguration[2];
}

- (id) initWithTileMatrix:(int *)matrix andWrapperFrame:(CGRect)frame {
    self = [super init];
    if ( self ) {
        matrixConfiguration[0] = matrix[0];
        matrixConfiguration[1] = matrix[1];
//        [self buildVirtualTiles];
    }
    return self;
}

//- (void)buildVirtualTiles {
//
//}

@end
