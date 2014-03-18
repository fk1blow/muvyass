//
// Created by Dragos on 2/18/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SKTileMatrix : NSObject

// the invisible frame for the tiles wrapper rect
@property (nonatomic, assign) CGRect wrapperFrame;

- (id) initWithRows:(int)rows columns:(int)columns;
- (id) initWithTilesMatrix:(int [])matrix visibleFrame:(CGRect)frame;

@end
