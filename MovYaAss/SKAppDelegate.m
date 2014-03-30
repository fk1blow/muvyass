//
//  SKAppDelegate.m
//  MovYaAss
//
//  Created by Dragos Tudorache on 2/17/14.
//  Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKAppDelegate.h"
#import "SKTileMatrixController.h"
#import "SKInputController.h"

@interface SKAppDelegate()
@property SKTileMatrixController *tileMatrixCtrl;
@end

@implementation SKAppDelegate
{
    id eventMonitor;   // An event monitor object; instance of
}

#pragma mark initialize application

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    /** Initialize tiles controller */

    self.tileMatrixCtrl = [[SKTileMatrixController alloc] init];

    /** Initialize input */

    // should manage the user keyboard input
    SKInputController *inputController = [[SKInputController alloc] init];


//    NSLog(@"%@", [self window]);
}


// First, you SHOULD build the repositioning system, the grid and the key manipulation logic and
// then think about the accessibility api, the window, observers and shit like that !!!


- (IBAction)handleTestTileDetection:(id)sender {
    [self.tileMatrixCtrl testTileDetectionOnFrame:[[self window] frame]];
    
//    NSLog(@"%f, %f", self.window.frame.origin.x, self.window.frame.origin.y);
//    NSLog(@"%f", [[NSScreen mainScreen]visibleFrame].size.height/2);// 1680 / 2 x 1024 // 840 x 512
}

@end
