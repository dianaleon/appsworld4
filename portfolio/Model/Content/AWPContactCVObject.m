//
//  AWPContactCVObject.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/3/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPContactCVObject.h"
#import "AWPContactItem.h"

@implementation AWPContactCVObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = object_type_contact_cv;
        NSArray* values = [dictionary objectForKey:@"values"];
        NSMutableArray* jsonObjects = [NSMutableArray array];
        for(NSDictionary* value in values) {
            AWPContactItem* contactItem = [AWPContactItem new];
            contactItem.title = [value objectForKey:@"title"];
            contactItem.value = [value objectForKey:@"value"];
            [jsonObjects addObject:contactItem];
        }
        _objects = [NSArray arrayWithArray:jsonObjects];
    }
    
    return self;
}

@end
