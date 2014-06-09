//
//  AWPPortfolio.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPBaseModel.h"
#import "AWPClient.h"
#import "AWPTheme.h"
#import "AWPMenu.h"

@interface AWPPortfolio : AWPBaseModel
@property (nonatomic, readonly) NSString* id_app;
@property (nonatomic, readonly) NSString* id_user;
@property (nonatomic, readonly) NSString* state;
@property (nonatomic, readonly) NSString* nameApp;
@property (nonatomic, readonly) NSString* type;

@property (nonatomic, readonly) NSDictionary* pages;
@property (nonatomic, readonly) AWPClient* client;
@property (nonatomic, readonly) AWPTheme* theme;
@property (nonatomic, readonly) AWPMenu* menu;

@end