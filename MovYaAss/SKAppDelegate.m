//
//  SKAppDelegate.m
//  MovYaAss
//
//  Created by Dragos Tudorache on 2/17/14.
//  Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKAppDelegate.h"
#import "SKEventsController.h"

@implementation SKAppDelegate
{
    id eventMonitor;   // An event monitor object; instance of
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Initializing events controller
	SKEventsController* eventsController = [[SKEventsController alloc] init];
	
	NSEvent * (^monitorHandler)(NSEvent *);
    monitorHandler = ^NSEvent * (NSEvent * theEvent){
        [eventsController handleEvent:theEvent];
		// Return the event, a new event, or, to stop
        // the event from being dispatched, nil
        return theEvent;
    };
    
    // Creates an object we do not own, but must keep track
    // of so that it can be "removed" when we're done
    eventMonitor = [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask | NSFlagsChangedMask
                                                         handler:monitorHandler];


}

@end
