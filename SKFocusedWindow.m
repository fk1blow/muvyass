//
//  SKFocusedWindow.m
//  MovYaAss
//
//  Created by Dragos on 2/17/14.
//  Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKFocusedWindow.h"

@implementation SKFocusedWindow

-(void)moveWindowTo:(CGRect)position {
    NSLog(@"positioning current window to: %@", NSStringFromRect(position));
    CGRect frame = self.currentFocusedWindow.frame;
    CGRect newPosition = CGRectMake(position.origin.x, position.origin.y, frame.size.width, frame.size.height);
    [_currentFocusedWindow setFrame:newPosition display:YES animate:YES];
}

@end
