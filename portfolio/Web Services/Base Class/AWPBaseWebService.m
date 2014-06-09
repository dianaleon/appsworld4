//
//  AWPBaseWebService.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPBaseWebService.h"
#import "AWPAPIClient.h"

@interface AWPBaseWebService()
{
    NSMutableDictionary *_parameters;
}
@end

@implementation AWPBaseWebService

- (NSString *)endpoint
{
    NSAssert(NO, @"Subclasses must implement this method");
    return nil;
}

- (NSMutableDictionary *)parameters
{
    if(!_parameters)
        _parameters = [NSMutableDictionary dictionary];
    return _parameters;
}

-(void)configureRequest:(NSMutableURLRequest *)request
{
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
}

- (id)responseObjectFromServiceResponse:(id)serviceResponse
{
    if (serviceResponse && ![serviceResponse isEqual:[NSNull null]]) {
        [serviceResponse recursivelyRemoveNulls];
        return serviceResponse;
    }
    return nil;

}

- (NSError*) serviceLevelErrorFromServiceResponse: (id)responseObject
{
    return nil;
}

- (NSError*) serviceLevelErrorFromNetworkLevelError: (NSError*)networkError
{
    NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
    [errorDetail setValue:@"Failed to do something wicked." forKey:NSLocalizedDescriptionKey];

    NSError* error = [NSError errorWithDomain:networkError.domain code:networkError.code userInfo:errorDetail];
    return error;
}


- (void)startWithCompletion:(AWPHTTPClientCompletionBlock)completionBlock
{
    // Set up a basic completion block to prevent having to check it all the time later
    if (!completionBlock)
    {
        completionBlock = ^(id response, NSError *error){};
    }
    // Here we call the endpoint and parameter methods from the subclass to prepare the request
    NSMutableURLRequest *request = [[AWPAPIClient sharedClient] requestWithMethod:@"GET" path:[self endpoint] parameters:[self parameters]];
    // This allows any additional changes to the request
    [self configureRequest:request];
    AFHTTPRequestOperation *requestOperation = [[AWPAPIClient sharedClient] HTTPRequestOperationWithRequest:request
                                                                                                     success:^(AFHTTPRequestOperation *operation, id responseObject)
                                                {
                                                    NSError *serviceLevelError = [self serviceLevelErrorFromServiceResponse:responseObject];
                                                    if (serviceLevelError)
                                                    {
                                                        completionBlock(nil,serviceLevelError);
                                                    }
                                                    else
                                                    {
                                                        // Here we call the response object method implemented in the subclass
                                                        id processedResponse = [self responseObjectFromServiceResponse:responseObject];
                                                        completionBlock(processedResponse, nil);
                                                    }
                                                }
                                                                                                     failure:^(AFHTTPRequestOperation *operation, NSError *error)
                                                {
                                                    NSError *friendlyError = [self serviceLevelErrorFromNetworkLevelError:error];
                                                    completionBlock(nil, friendlyError);
                                                }
                                                ];
    [[AWPAPIClient sharedClient] enqueueHTTPRequestOperation:requestOperation];
}
@end
