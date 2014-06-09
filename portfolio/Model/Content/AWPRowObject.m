//
//  AWPRowObject.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPRowObject.h"

@implementation AWPRowObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        NSArray* values = [dictionary objectForKey:@"value"];
        for(NSDictionary* value in values) {
            NSString* tipo = [[value objectForKey:@"code"] lowercaseString];
            if ([tipo isEqualToString:@"text"]) {
                [_objects addObject:[[AWPTextObject alloc] initWithDictionary:value]];
            }
            if ([tipo isEqualToString:@"image"]) {
                [_objects addObject:[[AWPImageObject alloc] initWithDictionary:value]];
            }
        }
    }
    
    return self;
}

@end
