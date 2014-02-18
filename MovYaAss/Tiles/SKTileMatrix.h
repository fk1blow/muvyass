//
// Created by Dragos on 2/18/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SKTileMatrix : NSObject {
    // currently used tile matrix array as rows x columns
    int matrixConfiguration[2];
}

// the invisible frame for the tiles wrapper rect
@property (assign) CGRect wrapperFrame;

- (id) initWithTileMatrix:(int *)matrix andWrapperFrame:(CGRect)frame;

@end
