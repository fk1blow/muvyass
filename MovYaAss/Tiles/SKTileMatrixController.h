//
// Created by Dragos on 2/19/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKTileMatrix.h"


@interface SKTileMatrixController : NSObject

// @TODO move this variable to a private scope of this object
@property (retain) SKTileMatrix *tileMatrix;

- (id) initWithTileMatrix:(SKTileMatrix *)tileMatrix;

@end
