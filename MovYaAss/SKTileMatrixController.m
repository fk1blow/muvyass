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
        _tileMatrix = [[SKTileMatrix alloc] initWithRows:2 columns:2];
    }
    return self;
}

#pragma mark Testing

-(void)testTileDetectionOnFrame:(NSRect)frame {
    [self.tileMatrix testFindTileForRect:frame];
}

@end
