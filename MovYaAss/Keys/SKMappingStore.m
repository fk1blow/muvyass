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
                @"left": [NSSet setWithObjects:@0, @1, @2, nil]
        };
    }
    return self;
}

-(void)recognizeMappings:(NSSet *)input {
    NSDictionary *mappings = self.keyboardMappings;


    NSLog(@"%c", [self.keyboardMappings[@"left"] isEqualTo:input]);

    //for(id key in self.keyboardMappings) {
    //    if ([mappings[key] isEqualTo:input]) {
    //        NSLog(@"43224");
    //    }
    //}


    NSLog(@"mappings tested %@ for actual mappings %@", input, self.keyboardMappings);
}

@end
