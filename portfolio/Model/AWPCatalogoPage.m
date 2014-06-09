//
//  AWPCatalogoPage.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/20/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPCatalogoPage.h"

@implementation AWPCatalogoPage

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        
        NSArray * data = [dictionary objectForKey:@"data"];
        for (NSDictionary* content in data) {
            NSString* tipo = [[content objectForKey:@"tipo"] lowercaseString];
            if ([tipo isEqualToString:@"text"]) {
                [_objects addObject:[[AWPTextObject alloc] initWithDictionary:content]];
            }
            if ([tipo isEqualToString:@"image"]) {
                [_objects addObject:[[AWPImageObject alloc] initWithDictionary:content]];
            }
        }
    }
    return self;
}

@end
