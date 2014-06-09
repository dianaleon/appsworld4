//
//  AWPSectionCVObject.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/3/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPSectionCVObject.h"
#import "AWPSectionItemObject.h"

@implementation AWPSectionCVObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = object_type_contact_cv;
        NSArray* values = [dictionary objectForKey:@"info"];
        NSMutableArray* jsonObjects = [NSMutableArray array];
        for(NSDictionary* value in values) {
            [jsonObjects addObject:[[AWPSectionItemObject alloc] initWithDictionary:value]];
        }
        _objects = [NSArray arrayWithArray:jsonObjects];
    }
    
    return self;
}

@end
