//
// Created by Dragos on 2/18/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SKTileMatrix : NSObject {
    CGRect _wrapperFrame;
}

// the invisible frame for the tiles wrapper rect
@property (assign) CGRect wrapperFrame;

// provide a matrix for the tile and a frame for the wrapper
- (id) initWithTileMatrix:(int *)matrix andVisibleFrame:(CGRect)frame;

@end
