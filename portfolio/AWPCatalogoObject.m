//
//  AWPCatalogoObject.m
//  portfolio
//
//  Created by diana leon on 4/21/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPCatalogoObject.h"

@implementation AWPCatalogoObject
-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = object_type_network;
        _subtype = [dictionary objectForKey:@"tipo"];
    }
    
    return self;
}
@end
