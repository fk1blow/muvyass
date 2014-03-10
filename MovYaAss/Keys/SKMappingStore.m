//
// Created by Dragos on 2/23/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import "SKMappingStore.h"


@implementation SKMappingStore {

}

-(id)init {
    self = [super init];
    if (self) {
        _keyboardMappings = @{
            @"left": [NSMutableSet setWithObjects:@58, @55, @123, nil],
            @"right": [NSMutableSet setWithObjects:@58, @55, @124, nil]
        };
    }
    return self;
}

-(void)recognizeMappings:(NSSet *)input {
    NSDictionary *mappings = self.keyboardMappings;


    for(id item in self.keyboardMappings) {
       if ([input isEqualToSet:self.keyboardMappings[item]]) {
           NSLog(@"%@", item);
        }
    }
}

@end
