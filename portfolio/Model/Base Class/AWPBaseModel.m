//
//  AWPBaseModel.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPBaseModel.h"

@interface AWPBaseModel()
@end

@implementation AWPBaseModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        _internalData = [dictionary copy];
    }
    return self;
}

@end
