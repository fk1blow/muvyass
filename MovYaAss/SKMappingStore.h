//
// Created by Dragos on 2/23/14.
// Copyright (c) 2014 Dragos Tudorache. All rights reserved.
//

#import <Foundation/Foundation.h>


/*@class SKMappingStore;
@protocol SKMappingStoreDelegate <NSObject>

-(void)didRecognizedMappings:(NSSet *)mappings forKey:(NSString *)key;

@end*/


@interface SKMappingStore : NSObject

/*
equivalent to:
    -(void)setDelegate:(id <SKMappingStoreDelegate>)delegate;
    -(id<SKMappingStoreDelegate>)delegate;
*/
//@property (nonatomic, weak) id <SKMappingStoreDelegate>delegate;
@property (nonatomic, strong) NSDictionary *keyboardMappings;

-(NSDictionary *)recognizeMappings:(NSSet *)mappings;

@end
