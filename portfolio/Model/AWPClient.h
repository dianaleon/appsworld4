//
//  AWPClient.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWPBaseModel.h"

@interface AWPClient : AWPBaseModel

@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSString* surname;
@property (nonatomic, readonly) NSString* update;
@property (nonatomic, readonly) NSString* resources;

@end
