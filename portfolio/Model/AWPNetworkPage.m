//
//  AWPNetworkPage.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 3/25/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPNetworkPage.h"
#import "AWPNetworkObject.h"

@implementation AWPNetworkPage

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        
        NSArray * data = [dictionary objectForKey:@"data"];
        for (NSDictionary* content in data) {
            [_objects addObject:[[AWPNetworkObject alloc] initWithDictionary:content]];
        }
    }
    return self;
}

@end
