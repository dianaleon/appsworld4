//
//  AWPAPIClient.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AFHTTPClient.h"

@interface AWPAPIClient : AFHTTPClient

+ (AWPAPIClient *)sharedClient;

@end
