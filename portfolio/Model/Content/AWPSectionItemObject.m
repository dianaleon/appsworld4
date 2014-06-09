//
//  AWPSectionItemObject.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/3/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPSectionItemObject.h"

@implementation AWPSectionItemObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = object_type_network;
        _subscript = [dictionary objectForKey:@"subscript"];
    }
    
    return self;
}
@end
