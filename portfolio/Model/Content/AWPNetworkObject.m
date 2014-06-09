//
//  AWPNetworkObject.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 3/25/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPNetworkObject.h"

@implementation AWPNetworkObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = object_type_network;
        _subtype = [dictionary objectForKey:@"tipo"];
    }
    
    return self;
}
@end
