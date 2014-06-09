//
//  AWPMenu.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWPBaseModel.h"
#import "AWPBackground.h"

@interface AWPMenu : AWPBaseModel

@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSString* subtitle;
@property (nonatomic, readonly) NSString* icon;
@property (nonatomic, readonly) NSString* gradient_orientation;
@property (nonatomic, readonly) NSString* text_color;
@property (nonatomic, readonly) AWPBackground* background;
@property (nonatomic, readonly) NSDictionary* pages;
@property (nonatomic, readonly) NSArray* pagesIndex;

@end
