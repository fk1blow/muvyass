//
// Created by Dragos on 2/23/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SKMappingStore : NSObject

@property (nonatomic, strong) NSDictionary *keyboardMappings;

-(void)recognizeMappings:(NSSet *)mappings;

@end
