//
//  AWPTextObject.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 3/25/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPTextObject.h"

@implementation AWPTextObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = object_type_text;
    }
    
    return self;
}

@end
