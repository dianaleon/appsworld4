//
//  AWPTheme.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWPBaseModel.h"
#import "AWPBackground.h"

@interface AWPTheme : AWPBaseModel

@property (nonatomic, readonly) NSString* code;
@property (nonatomic, readonly) NSString* urlImages;
@property (nonatomic, readonly) NSString* homeImage;
@property (nonatomic, readonly) AWPBackground* background;
@property (nonatomic, readonly) AWPBackground* titleBarBackground;
@property (nonatomic, readonly) AWPBackground* menuBackground;
@property (nonatomic, readonly) AWPBackground* menuItemBackground;
@property (nonatomic, readonly) AWPBackground* homeBackground;
@property (nonatomic, readonly) NSString* colors;

@end
