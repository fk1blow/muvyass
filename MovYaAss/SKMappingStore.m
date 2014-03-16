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
            @"left": [NSSet setWithObjects:@59, @123, nil], // ctrl + arrow-left
            //@"right": [NSSet setWithObjects:@59, @56, @124, nil], // ctrl + arrow-right
            @"right": [NSSet setWithObjects:@59, @124, nil], // ctrl + arrow-right
            @"top": [NSSet setWithObjects:@59, @126, nil], // ctrl + arrow-up
            @"bottom": [NSSet setWithObjects:@59, @125, nil] // ctrl + arrow-down
        };
    }
    return self;
}

-(NSDictionary *)recognizeMappings:(NSSet *)input {
    NSDictionary *result;
    for(id key in self.keyboardMappings) {
        NSSet *item = self.keyboardMappings[key];
       if ([input isEqualToSet:item]) {
           result = [NSDictionary dictionaryWithObject:item forKey:key];
           //if ([self.delegate respondsToSelector:@selector(didRecognizedMappings:forKey:)])
           //    [self.delegate didRecognizedMappings:item forKey:key];
       }
    }
    return result;
}

@end
