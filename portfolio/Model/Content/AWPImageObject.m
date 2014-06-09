//
//  AWPImageObject.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 3/25/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPImageObject.h"

@implementation AWPImageObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = object_type_image;
    }
    
    return self;
}
@end
