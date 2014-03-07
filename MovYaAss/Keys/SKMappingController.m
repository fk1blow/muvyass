//
// Created by Dragos on 3/4/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKMappingController.h"

@interface SKMappingController()
    /**
    * Holds a reference to all the currently active input items
    * In the case of the keyboard, this contains an list of all
    * keyboard items currently pressed
    *
    * @todo (dragos) should become a dictionary, once settled on a data structure...
    * */
    @property (nonatomic, strong) NSMutableArray *currentInput;
@end

@implementation SKMappingController {

}

-(id) init {
    self = [super init];

    if (self) {
        _currentInput = [[NSMutableArray alloc] init];
    }

    return self;
}

-(void) mapInputFor:(NSEvent *)event {
    NSNumber *keyCode = [NSNumber numberWithUnsignedShort:event.keyCode];
    if ([self.currentInput containsObject:keyCode] == NO) {
        [self.currentInput addObject:keyCode];
    }
    NSLog(@"added to current input %@, %@", keyCode, self.currentInput);
}

-(void) unmapInputFor:(NSEvent *)event {
    NSNumber *keyCode = [NSNumber numberWithUnsignedShort:event.keyCode];
    if ([self.currentInput containsObject:keyCode]) {
        [[self currentInput] removeObject:keyCode];
    }
    NSLog(@"removed from current input %@", self.currentInput);
}

@end
