//
//  SKAppDelegate.m
//  MovYaAss
//
//  Created by Dragos Tudorache on 2/17/14.
//  Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKAppDelegate.h"
#import "SKEventsController.h"
#import "SKTileMatrix.h"
#import "SKTileMatrixController.h"
#import "SKInputController.h"

@implementation SKAppDelegate
{
    id eventMonitor;   // An event monitor object; instance of
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    /** Initialize matrix and controller  */

    // initialize tile matrix
    int matrixConfiguration[2] = {2,2};
    SKTileMatrix *tileMatrix = [[SKTileMatrix alloc] initWithTileMatrix:matrixConfiguration
                                                        andVisibleFrame:[[NSScreen mainScreen] visibleFrame]];
    // initialize tiles controller
    SKTileMatrixController *tileCtrl = [[SKTileMatrixController alloc] initWithTileMatrix:tileMatrix];

    /** Initialize events controller */

    // @TODO refactor object by rename or just delete it
    // Initializing events controller
	SKEventsController* eventsCtrl = [[SKEventsController alloc] init];

    /** Initialize input controller */

    // should manage the user keyboard input
    SKInputController *inputController = [[SKInputController alloc] init];

    /** some other stuff */

    SKFocusedWindow * focusedWindowController = [[SKFocusedWindow alloc] init];
    [focusedWindowController setCurrentFocusedWindow:self.window];

    NSEvent * (^monitorHandler)(NSEvent *);
    monitorHandler = ^NSEvent * (NSEvent * theEvent){
        [eventsCtrl handleEvent:theEvent];
        [focusedWindowController moveWindowTo:CGRectMake(0, 0, 300, 150)];

		// Return the event, a new event, or, to stop
        // the event from being dispatched, nil
        return theEvent;
    };
    
    // Creates an object we do not own, but must keep track
    // of so that it can be "removed" when we're done
    eventMonitor = [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask | NSFlagsChangedMask
                                                         handler:monitorHandler];
}


// First, you SHOULD build the repositioning system, the grid and the key manipulation logic and
// then think about the accessibility api, the window, observers and shit like that !!!


@end
