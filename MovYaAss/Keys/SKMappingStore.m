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
            @"left": [NSSet setWithObjects:@59, @56, @123, nil], // ctrl + arrow-left
            //@"right": [NSSet setWithObjects:@59, @56, @124, nil], // ctrl + arrow-right
            //@"top": [NSSet setWithObjects:@59, @56, @126, nil], // ctrl + arrow-up
            //@"bottom": [NSSet setWithObjects:@59, @56, @125, nil] // ctrl + arrow-down
        };
    }
    return self;
}

-(void)recognizeMappings:(NSSet *)input {
    for(id item in self.keyboardMappings) {
        NSLog(@"input is %@", input);
        NSLog(@"itertions is %@", self.keyboardMappings[item]);
        //NSLog(@"%@ and current item %@", item, self.keyboardMappings[item]);
        //NSLog(@"input is %@", input);
       if ([input isEqualToSet:self.keyboardMappings[item]]) {
           //NSLog(@"input is %@", input);
           //NSLog(@"itertions is %@", input);
           NSLog(@"%@", item);
        }
    }
}

@end
