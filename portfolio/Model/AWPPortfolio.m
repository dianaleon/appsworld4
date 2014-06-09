//
//  AWPPortfolio.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPortfolio.h"
#import "AWPType.h"
#import "AWPPage.h"

@implementation AWPPortfolio

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _id_app = [self.internalData objectForKey:@"id"];
        _id_user = [self.internalData objectForKey:@"id_user"];
        _state = [self.internalData objectForKey:@"state"];
        _nameApp = [self.internalData objectForKey:@"nameApp"];
        _type = [self.internalData objectForKey:@"type"];
        
        _client = [[AWPClient alloc] initWithDictionary: [self.internalData objectForKey:@"client"]];
        _theme = [[AWPTheme alloc] initWithDictionary: [self.internalData objectForKey:@"theme"]];
        _menu = [[AWPMenu alloc] initWithDictionary: [self.internalData objectForKey:@"menu"]];
        if (_menu)
            _pages = _menu.pages;
    }
    return self;
}
@end
