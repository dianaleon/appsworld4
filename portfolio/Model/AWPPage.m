//
//  AWPPage.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/11/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPage.h"

@implementation AWPPage

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _objects = [NSMutableArray array];
        _type = [[AWPType alloc] initWithDictionary: [self.internalData objectForKey:@"type"]];
        _pos = [self.internalData objectForKey:@"pos"];
        _title = [self.internalData objectForKey:@"title"];
        _content = [self.internalData objectForKey:@"content"];
        _iconURL = [self.internalData objectForKey:@"url_icon"];
        _layout = [self.internalData objectForKey:@"layout"];
        if (!_layout || [[NSNull null] isEqual:_layout])
            _layout = @"image";
    }
    return self;
}

@end
