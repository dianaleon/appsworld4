//
//  AWPCurriculumPage.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPCurriculumPage.h"

@implementation AWPCurriculumPage

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        NSArray * data = [dictionary objectForKey:@"data"];
        for (NSDictionary* content in data) {
            NSString* tipo = [[content objectForKey:@"code"]lowercaseString];
            if ([tipo isEqualToString:@"contact"]) {
                [_objects addObject:[[AWPContactCVObject alloc] initWithDictionary:content]];
            }
            if ([tipo isEqualToString:@"image"]) {
                [_objects addObject:[[AWPImageObject alloc] initWithDictionary:content]];
            }
            if ([tipo isEqualToString:@"section"]) {
                [_objects addObject:[[AWPSectionCVObject alloc] initWithDictionary:content]];
            }
        }
    }
    return self;
}


@end
