//
//  AWPType.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPType.h"

@implementation AWPType
-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = [self.internalData objectForKey:@"code"];
        _background = [[AWPBackground alloc] initWithBackgroundString:[self.internalData objectForKey:@"background"]];
        
        if ([[_type lowercaseString] isEqualToString:@"text"]) {
            _typeValue = type_text;
        }
        if ([[_type lowercaseString] isEqualToString:@"image"]) {
            _typeValue = type_image;
        }
        
        if ([[_type lowercaseString] isEqualToString:@"galeriamultimedia"]) {
            _typeValue = type_photo_galery;
        }

        if ([[_type lowercaseString] isEqualToString:@"contacto"]) {
            _typeValue = type_contact;
        }
        if ([[_type lowercaseString] isEqualToString:@"redessociales"]) {
            _typeValue = type_network;
        }
        if ([[_type lowercaseString] isEqualToString:@"video"]) {
            _typeValue = type_video;
        }
        
        //NUEVAS PAGINAS
        
        if ([[_type lowercaseString] isEqualToString:@"photo_txt_gridlist"]) {
            _typeValue = type_photo_txt_grid_list;
        }
        
        if ([[_type lowercaseString] isEqualToString:@"catalogo"]) {
            _typeValue = type_catalogo;
        }
        
    }
    return self;
}


@end
