//
//  AWPClient.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPClient.h"

@implementation AWPClient

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _name = [self.internalData objectForKey:@"name"];
        _surname = [self.internalData objectForKey:@"surname"];
        _update = [self.internalData objectForKey:@"update"];
        _resources = [self.internalData objectForKey:@"resources"];
    }
    return self;
}
@end