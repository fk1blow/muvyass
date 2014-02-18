//
//  SKFocusedWindow.h
//  MovYaAss
//
//  Created by Dragos on 2/17/14.
//  Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SKFocusedWindow : NSObject

@property (assign) NSWindow *currentFocusedWindow;

-(void)moveWindowTo:(CGRect)position;

@end
