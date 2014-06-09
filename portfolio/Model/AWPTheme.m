//
//  AWPTheme.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPTheme.h"

@implementation AWPTheme

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _code = [self.internalData objectForKey:@"code"];
        _urlImages = [self.internalData objectForKey:@"urlImages"];
        _background = [[AWPBackground alloc] initWithBackgroundString: [self.internalData objectForKey:@"background"]];
        _titleBarBackground = [[AWPBackground alloc] initWithBackgroundString:[self.internalData objectForKey:@"titleBarBackground"]];
        _menuBackground = [[AWPBackground alloc] initWithBackgroundString:[self.internalData objectForKey:@"menuBackground"]];
        _menuItemBackground = [[AWPBackground alloc] initWithBackgroundString:[self.internalData objectForKey:@"menuItemBackground"]];
        _homeBackground = [[AWPBackground alloc] initWithBackgroundString:[self.internalData objectForKey:@"homeBackground"]];
        _colors = [self.internalData objectForKey:@"colors"];
        _homeImage = [self.internalData objectForKey:@"home_img"];
    }
    return self;
}
@end