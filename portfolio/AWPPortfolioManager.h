//
//  AWPPortfolioManager.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/19/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWPPortfolio.h"


@class AWPPortfolioManager;

@protocol AWPPortfolioManagerDelegate <NSObject>

- (void)portfolioReady: (AWPPortfolio*) portfolio;
- (void)portfolioError: (NSError *) error;

@end

@interface AWPPortfolioManager : NSObject

@property (nonatomic, strong) AWPPortfolio* portfolio;
-(void) getPortfolioAsync:(id<AWPPortfolioManagerDelegate>) delegate;

+ (instancetype)sharedManager;


@end
