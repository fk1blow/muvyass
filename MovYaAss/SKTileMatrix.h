//
// Created by Dragos on 2/18/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SKTileMatrix : NSObject

// the invisible frame for the tiles wrapper rect
@property (nonatomic, assign) CGRect wrapperFrame;

// initializers
- (id) initWithRows:(int)rows columns:(int)columns;
- (id) initWithRows:(int)rows columns:(int)columns visibleFrame:(CGRect)frame;

// public interface
//- (id) getTileAtPoint:(CGPoint)point;
- (void)testFindTileForRect:(NSRect)frame;

@end
