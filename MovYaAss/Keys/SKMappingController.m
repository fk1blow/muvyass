//
// Created by Dragos on 3/4/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKMappingController.h"

@interface SKMappingController()
    // @todo (dragos) should become a dictionary, once settled on a data structure...
    @property (nonatomic, strong) NSMutableArray *currentInput;
@end

@implementation SKMappingController {

}

-(void) mapCommandToEvent:(NSEvent *)inputEvent {
    NSLog(@"mapping command to event: %@", inputEvent);
    //int *keycode = inputEvent.keyCode.intValue;
    int r = arc4random() % 74;
    NSNumber *keyCodeDummy = [NSNumber numberWithInt:r];
    [self.currentInput addObject:keyCodeDummy];
    NSLog(@"%@", self.currentInput);
}

@end
