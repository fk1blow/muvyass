//
// Created by Dragos on 2/19/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKTileMatrixController.h"


@interface SKTileMatrixController()

@property (strong) SKTileMatrix *tileMatrix;

@end

@implementation SKTileMatrixController

- (id) initWithTileMatrix:(SKTileMatrix *)matrix {
    self = [super init];
    if (self) {
        _tileMatrix = matrix;
    }
    return self;
}

@end
