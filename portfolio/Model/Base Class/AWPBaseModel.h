//
//  AWPBaseModel.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AWPBaseModel : NSObject

@property (nonatomic,readonly) NSDictionary* internalData;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
