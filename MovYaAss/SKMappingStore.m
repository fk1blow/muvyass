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

-(void)recognizeMappings:(NSSet *)input {
    for(id key in self.keyboardMappings) {
        NSSet *item = self.keyboardMappings[key];
       if ([input isEqualToSet:item]) {
            if ([self.delegate respondsToSelector:@selector(didRecognizedInputFor:)])
                [self.delegate didRecognizedInputFor:item];
       }
    }
}

@end
