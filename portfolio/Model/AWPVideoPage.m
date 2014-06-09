//
//  AWPVideoPage.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPVideoPage.h"

@implementation AWPVideoPage

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
            if ([tipo isEqualToString:@"video"]) {
                [_objects addObject:[[AWPVideoObject alloc] initWithDictionary:content]];
            }
        }
    }
    return self;
}


@end
