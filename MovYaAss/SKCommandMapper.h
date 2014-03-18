//
// Created by Dragos on 3/4/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SKCommandMapper;
@protocol SKMappingsDelegate<NSObject>

-(void)commandMapper:(SKCommandMapper *)mapper didRecognizedCommand:(NSDictionary *)command;

@end

//
// Maps a set of inputs(keyboard, mouse, etc, to some
// named commands like: move, grow, shrink, move top, etc
//
// - Store every key pressed
// - check if the keys correspond to a set predefined mappings
// - it finishes when a key is released because, because that
// should mark the beginning of a new input mapping sequence
//
@interface SKCommandMapper : NSObject {
}

/*
equivalent to:
    -(void)setDelegate:(id <SKMappingStoreDelegate>)delegate;
    -(id<SKMappingStoreDelegate>)delegate;
*/
@property (nonatomic, weak) id <SKMappingsDelegate>delegate;

-(void) mapCommandFor:(NSEvent *)event;
-(void) unmapCommandFor:(NSEvent *)event;

@end
