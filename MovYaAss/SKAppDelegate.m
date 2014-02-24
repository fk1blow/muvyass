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

#pragma mark initialize application

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    /** Initialize matrix and tile controller */

    int configurationMatrix [2] = {2, 2};
    // initialize tile matrix
    SKTileMatrix *tileMatrix = [[SKTileMatrix alloc] initWithTileMatrix:configurationMatrix
                                                        andVisibleFrame:[[NSScreen mainScreen] visibleFrame]];

    SKTileMatrixController *tileCtrl = [[SKTileMatrixController alloc] initWithTileMatrix:tileMatrix];

    /** Initialize input controller */

    // should manage the user keyboard input
    SKInputController *inputController = [[SKInputController alloc] init];
}


// First, you SHOULD build the repositioning system, the grid and the key manipulation logic and
// then think about the accessibility api, the window, observers and shit like that !!!


@end
