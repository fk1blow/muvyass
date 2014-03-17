//
// Created by Dragos on 2/19/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKTileMatrixController.h"
#import "SKTileMatrix.h"


@interface SKTileMatrixController()

@property (strong) SKTileMatrix *tileMatrix;

@end

@implementation SKTileMatrixController

- (id) init {
    self = [super init];
    if (self) {
        int tileConfiguration[2] = {2, 2};
        _tileMatrix = [[SKTileMatrix alloc] initWithTilesMatrix: tileConfiguration
                                               andVisibleFrame: [[NSScreen mainScreen] visibleFrame]];
    }
    return self;
}

@end
