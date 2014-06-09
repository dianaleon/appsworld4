//
//  AWPContactPage.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/3/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPContactPage.h"

@implementation AWPContactPage

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        
        NSArray * data = [dictionary objectForKey:@"data"];
        for (NSDictionary* content in data) {
            AWPContactObject* contact = [[AWPContactObject alloc] initWithDictionary:content];
            NSString* tipo = [[content objectForKey:@"tipo"] lowercaseString];
            contact.subtype =tipo;
            [_objects addObject:contact];
        }
    }
    return self;
}


@end
