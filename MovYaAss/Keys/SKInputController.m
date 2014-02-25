//
// Created by Dragos on 2/21/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKInputController.h"

#pragma mark Extension

@interface SKInputController() {
}

    @property (strong) id eventMonitor;

@end

#pragma mark Implementation

@implementation SKInputController {

}

- (id) init {
    self = [super init];
    if (self) {
        [self addKeyboardMonitor];
    }
    return self;
}

#pragma mark Private

- (void)addKeyboardMonitor {
    NSEvent * (^monitorHandler)(NSEvent *);
    monitorHandler = ^NSEvent * (NSEvent * theEvent){
        NSLog(@"key event handled..");
//        [focusedWindowController moveWindowTo:CGRectMake(0, 0, 300, 150)];

        // Return the event, a new event, or, to stop
        // the event from being dispatched, nil
        return theEvent;
    };

    // Creates an object we do not own, but must keep track
    // of so that it can be "removed" when we're done
    self.eventMonitor = [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask | NSFlagsChangedMask
                                                         handler:monitorHandler];
}


@end
