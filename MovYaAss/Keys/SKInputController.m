//
// Created by Dragos on 2/21/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKInputController.h"
#import "SKMappingController.h"

#pragma mark Extension

@interface SKInputController()
//    @property (strong) id eventMonitor;
    @property (strong) SKMappingController *mappingController;
@end

#pragma mark Implementation

@implementation SKInputController {

}

- (id) init {
    self = [super init];
    if (self) {
        [self addKeyboardMonitor];
        _mappingController = [[SKMappingController alloc] init];
    }
    return self;
}

#pragma mark Private

- (void)addKeyboardMonitor {
    NSEvent * (^keyDownHandler)(NSEvent *);
    NSEvent * (^keyUpHandler)(NSEvent *);

    keyDownHandler = ^NSEvent * (NSEvent * inputEvent){
        [self.mappingController mapInputFor:inputEvent];
        // Return the event, a new event, or, to stop
        // the event from being dispatched, nil
        return inputEvent;
    };

    keyUpHandler = ^NSEvent * (NSEvent * inputEvent){
        [self.mappingController unmapInputFor:inputEvent];
        // Return the event, a new event, or, to stop
        // the event from being dispatched, nil
        return inputEvent;
    };

    // Creates an object we do not own, but must keep track
    // of so that it can be "removed" when we're done
    [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask | NSFlagsChangedMask
                                                         handler:keyDownHandler];

    [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyUpMask | NSFlagsChangedMask
                                          handler:keyUpHandler];
}


@end
