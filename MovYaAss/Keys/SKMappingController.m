//
// Created by Dragos on 3/4/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKMappingController.h"
#import "SKMappingStore.h"

#pragma mark Extension

@interface SKMappingController()
    /*
        Holds a reference to all the currently active input items
        In the case of the keyboard, this contains an list of all
        keyboard items currently pressed
    */
    @property (nonatomic, strong) NSMutableSet *currentInput;

    /*
        reference to the mapping store that will recognize input commands
        Based on a set, the mappingStore will have to test if a given set
        of inputs is present inside another which belongs to a specific command.
        Also, the store should have a delegate to call when a command was found!
    */
    @property (nonatomic, strong) SKMappingStore *mappingStore;
@end

#pragma mark Implementation

@implementation SKMappingController {

}

-(id) init {
    self = [super init];
    if (self)
        _currentInput = [[NSMutableSet alloc] init];
        _mappingStore = [[SKMappingStore alloc] init];
    return self;
}

-(void) mapInputFor:(NSEvent *)event {
    NSNumber *keyCode = [NSNumber numberWithUnsignedShort:event.keyCode];
    // if the input set does not already contains the new element and if input is not repeated
    if ( ! [self.currentInput containsObject:keyCode] && ! [event isARepeat] ) {
        [self.currentInput addObject:keyCode];
        [self.mappingStore recognizeMappings:self.currentInput];
    }
}

-(void) unmapInputFor:(NSEvent *)event {
    NSNumber *keyCode = [NSNumber numberWithUnsignedShort:event.keyCode];
    if ( [self.currentInput containsObject:keyCode] ) {
        [self.currentInput removeObject:keyCode];
    }
}

@end
