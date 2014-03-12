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

    keyDownHandler = ^NSEvent * (NSEvent * event) {
        BOOL hasModifiers = [event modifierFlags] > 256;

        // check if modifiers are present
        if (([event type] == NSFlagsChanged)) {
            // ...and process input only if modifier flags are added, that is
            // only when the key is pressed and not after, as it seems to behaves atm
            if (hasModifiers) {
                [self.mappingController mapCommandFor:event];
            } else {
                [self.mappingController unmapCommandFor:event];
            }
        } else {
            if (![event isARepeat]) {
                [self.mappingController mapCommandFor:event];
            }
        }
        // Return the event, a new event, or, to stop
        // the event from being dispatched, nil
        return event;
    };

    keyUpHandler = ^NSEvent * (NSEvent * event) {
        [self.mappingController unmapCommandFor:event];
        // Return the event, a new event, or, to stop
        // the event from being dispatched, nil
        return event;
    };

    // Creates an object we do not own, but must keep track
    // of so that it can be "removed" when we're done
    [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask | NSFlagsChangedMask
                                                         handler:keyDownHandler];

    [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyUpMask handler:keyUpHandler];
}


@end
