//
//  AWPPageObject.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 3/25/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageObject.h"

@implementation AWPPageObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        id value;
        
        value = [dictionary objectForKey:@"content"];
        if (value) {
            _content = value;
        }
        value = [dictionary objectForKey:@"content_img"];
        if (value) {
            _content_img = value;
        }
        value = [dictionary objectForKey:@"pos"];
        if (value) {
            _pos =  [value intValue];
        }
        value = [dictionary objectForKey:@"description"];
        if (value) {
            _description = value;
        }
        value = [dictionary objectForKey:@"background"];
        if (value) {
            _background = [[AWPBackground alloc] initWithBackgroundString: value];
        }
        value = [dictionary objectForKey:@"textColor"];
        if (value) {
            _textColor = value;
        }
        value = [dictionary objectForKey:@"title"];
        if (value) {
            _title = value;
        }
        value = [dictionary objectForKey:@"subtitle"];
        if (value) {
            _subtitle = value;
        }
    }
    
    return self;
}


@end
