//
//  AWPPhotoGaleryPage.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/8/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPhotoGaleryPage.h"

@implementation AWPPhotoGaleryPage

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        
        NSArray * data = [dictionary objectForKey:@"data"];
        for (NSDictionary* content in data) {
            NSString* tipo = [[content objectForKey:@"tipo"] lowercaseString];
            if ([tipo isEqualToString:@"image"]) {
                [_objects addObject:[[AWPImageObject alloc] initWithDictionary:content]];
            }
        }
    }
    return self;
}

@end
