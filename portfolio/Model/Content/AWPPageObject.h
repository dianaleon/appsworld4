//
//  AWPPageObject.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 3/25/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWPBackground.h"

typedef enum
{
    object_type_text = 1,
    object_type_image = 2,
    object_type_contact_cv = 3,
    object_type_section_cv = 4,
    object_type_network = 5,
    object_type_contact = 6,
    object_type_video = 7,
} AWPPageObjectType;

@interface AWPPageObject : NSObject {

@protected AWPPageObjectType _type;

}

@property (nonatomic, readonly) NSString* content;
@property (nonatomic, readonly) NSString* content_img;
@property (nonatomic, readonly) int pos;
@property (nonatomic, readonly) NSString* description;
@property (nonatomic, readonly) AWPBackground* background;
@property (nonatomic, readonly) NSString* textColor;
@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSString* subtitle;
@property (nonatomic, readonly) AWPPageObjectType type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
