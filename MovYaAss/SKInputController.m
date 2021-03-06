//
// Created by Dragos on 2/21/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKInputController.h"
#import "SKCommandMapper.h"

#pragma mark Extension

@interface SKInputController()
    @property (strong) SKCommandMapper *commandMapper;
@end

#pragma mark Implementation

@implementation SKInputController {

}

- (id) init {
    self = [super init];
    if (self) {
        [self addKeyboardMonitor];
        _commandMapper = [[SKCommandMapper alloc] init];
        [_commandMapper setDelegate:self];
    }
    return self;
}

#pragma mark Delegates

-(void) commandMapper:(SKCommandMapper *)mapper didRecognizedCommand:(NSDictionary *)command {
    NSLog(@"recognized command %@", command);
}

#pragma mark Private

/*
    Monitors "keydown" event and intercepts the event trying
    to map it to some command or "impulse" of some other object...

    It separates the normal character keys from the modifier keys,
    making it really easy to map. In adition, it unmaps modifier keys
    having the keyUpHandler do the unmaping only for char keys
*/
- (void)addKeyboardMonitor {
    NSEvent * (^keyDownHandler)(NSEvent *);
    NSEvent * (^keyUpHandler)(NSEvent *);

    keyDownHandler = ^NSEvent * (NSEvent * event) {
        BOOL hasModifiers = [event modifierFlags] > 256;

        // Guarantees that only Key Modifiers are present
        if (([event type] == NSFlagsChanged)) {
            // ...and process input only if modifier flags are added, that is
            // only when the key is pressed and not after, as it seems to behaves atm
            if (hasModifiers)
                [self.commandMapper mapCommandFor:event];
            else
                [self.commandMapper unmapCommandFor:event];
        } else {
            if (![event isARepeat]) {
                [self.commandMapper mapCommandFor:event];
            }
        }
        // Return the event, a new event, or, to stop
        // the event from being dispatched, nil
        return event;
    };

    keyUpHandler = ^NSEvent * (NSEvent * event) {
        [self.commandMapper unmapCommandFor:event];
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
