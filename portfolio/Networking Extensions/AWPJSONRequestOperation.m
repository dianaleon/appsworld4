//
//  AWPJSONRequestOperation.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/11/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPJSONRequestOperation.h"

@implementation AWPJSONRequestOperation

- (NSJSONReadingOptions)JSONReadingOptions
{
    return super.JSONReadingOptions | NSJSONReadingMutableContainers;
}

@end
