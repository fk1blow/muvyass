//
// Created by Dragos on 3/4/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// Maps a set of inputs(keyboard, mouse, etc, to some
// named commands like: move, grow, shrink, move top, etc
//
// - Store every key pressed
// - check if the keys are corresponding to a predefined mappings
// - it finishes when a key is released because, because that
// should mark the beginning of a new input mapping sequence
//
@interface SKMappingController : NSObject

-(void) mapCommandToEvent:(NSEvent *)inputEvent;

@end
