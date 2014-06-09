//
//  AWPBaseWebService.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AFHTTPClient.h"
#import "NSJSONSerialization+RemovingNulls.h"

typedef void (^AWPHTTPClientCompletionBlock) (id, NSError*) ;

@interface AWPBaseWebService : NSObject

- (NSString *)endpoint;
- (NSMutableDictionary *)parameters;
- (void)configureRequest:(NSMutableURLRequest *)request;
- (id)responseObjectFromServiceResponse:(id)serviceResponse;

- (NSError*) serviceLevelErrorFromServiceResponse: (id)responseObject;
- (NSError*) serviceLevelErrorFromNetworkLevelError: (NSError*)networkError;

- (void)startWithCompletion:(AWPHTTPClientCompletionBlock)completionBlock;

@end
