//
//  SKEventsController.m
//  MovYaAss
//
//  Created by Dragos Tudorache on 2/17/14.
//  Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKEventsController.h"

@implementation SKEventsController

-(id)init {
    self = [super init];
    if (self) {
        //
    }
    return self;
}

-(void)handleEvent:(NSEvent *) event {
	NSLog(@"received event: %d", [event keyCode]);
}

@end
