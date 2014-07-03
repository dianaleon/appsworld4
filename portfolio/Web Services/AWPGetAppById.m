//
//  AWPGetAppById.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPGetAppById.h"
#import "AWPPortfolio.h"

@implementation AWPGetAppById

- (id)init
{
    if ([super init])
    {
        self.lectura = @"off";
    }
    return self;
}

- (NSMutableDictionary *)parameters
{
    
    NSMutableDictionary *parameters = [super parameters];
//    [parameters setValue:self.lectura forKey:@"lectura"];
    [parameters setValue:[NSNumber numberWithInt:self.id_app] forKey:@"id_app"];
    
    return parameters;
}

- (NSString *)endpoint
{
//    return @"http://www.appsworld.crealogica.eu/webServices/getAppById.php";
    return @"http://diana4love.com/AppsWorld/appsworld4.json";
}

- (id)responseObjectFromServiceResponse:(id)serviceResponse
{
    NSDictionary *dataDictionary = [super responseObjectFromServiceResponse:serviceResponse];
    
    AWPPortfolio* portfolio = [[AWPPortfolio alloc] initWithDictionary:dataDictionary];

    return portfolio;
}

- (NSError*) createErrorWithCode:(int)code andMessage:(NSString*)message
{
    NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
    [errorDetail setValue:message forKey:NSLocalizedDescriptionKey];
    return [NSError errorWithDomain:@"eu.crealogica.appsworld.awp" code:code userInfo:errorDetail];
}

- (NSError*) serviceLevelErrorFromServiceResponse: (id)responseObject
{
    NSDictionary *dataDictionary = [super responseObjectFromServiceResponse:responseObject];
    NSError *getAppUnsuccessful = [self createErrorWithCode:1 andMessage:@"Get Portfolio was not succesful"];
    if (!dataDictionary) {
        return getAppUnsuccessful;
    }
    NSNumber *appItem = [dataDictionary objectForKey:@"id"];
    if (!appItem || appItem.intValue != self.id_app) {
        return getAppUnsuccessful;
    }
    NSNumber *responseState = [dataDictionary objectForKey:@"state"];
    if (!responseState || responseState.intValue != 1) {
        return getAppUnsuccessful;
    }
    
    NSDictionary *client = [dataDictionary objectForKey:@"client"];
    if (!client)
    {
        return getAppUnsuccessful;
    }
    NSDictionary *menu = [dataDictionary objectForKey:@"menu"];
    if (!menu)
    {
        return getAppUnsuccessful;
    }

    return nil;
}


@end
