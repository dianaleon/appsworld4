//
//  AWPAPIClient.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPAPIClient.h"
#import "AWPJSONRequestOperation.h"

static NSString * const kAFAWPAPIBaseURLString = @"http://www.appsworld.crealogica.eu/webServices/";

@implementation AWPAPIClient

+ (AWPAPIClient *)sharedClient {
    static AWPAPIClient *_sharedClient = nil;
    static dispatch_once_t AWPAPIClientToken;
    dispatch_once(&AWPAPIClientToken, ^{
        _sharedClient = [[AWPAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kAFAWPAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AWPJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];



    return self;
}

@end