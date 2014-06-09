//
//  AWPPhotoTxtGridListPage.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/8/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPhotoTxtGridListPage.h"

@implementation AWPPhotoTxtGridListPage

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        
        NSArray * data = [dictionary objectForKey:@"data"];
        for (NSDictionary* content in data) {
            NSString* tipo = [[content objectForKey:@"code"] lowercaseString];
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
