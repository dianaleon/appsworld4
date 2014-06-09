//
//  AWPPortfolioManager.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/19/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPortfolioManager.h"
#import "AWPGetAppById.h"

@implementation AWPPortfolioManager

#pragma mark Singleton Methods

+ (id)sharedManager {
    static AWPPortfolioManager *sharedPortfolioManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPortfolioManager = [[self alloc] init];
    });
    return sharedPortfolioManager;
}

- (void)getPortfolioAsync:(id<AWPPortfolioManagerDelegate>)delegate {
    
    if (self.portfolio) {
        [self performSelector:@selector(invokePortfolioSuccess:) withObject:delegate afterDelay:0.1];
        return;
    }
    
    AWPGetAppById* service = [AWPGetAppById new];
    service.id_app = 1718;
    service.lectura = @"off";
    
    [service startWithCompletion:^(AWPPortfolio* portfolio, NSError * error) {
        if (error) {
            [self invokePortfolioError:delegate withError:error];
            NSLog(@"ERROR: %@", [error description]);
        } else {
            self.portfolio = portfolio;
            [self invokePortfolioSuccess:delegate];
            NSLog(@"TODO OK");
        }
    }];
}

- (void) invokePortfolioSuccess:(id<AWPPortfolioManagerDelegate>)delegate {
    if ([delegate respondsToSelector:@selector(portfolioReady:)] ) {
        [delegate portfolioReady:self.portfolio];
    }
}
- (void) invokePortfolioError:(id<AWPPortfolioManagerDelegate>)delegate withError:(NSError*) error{
    if ([delegate respondsToSelector:@selector(portfolioError:)] ) {
        [delegate portfolioError:error];
    }
}


@end
