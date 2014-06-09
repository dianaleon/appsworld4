//
//  AWPMenu.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPMenu.h"
#import "AWPPage.h"
#import "AWPImagePage.h"
#import "AWPTextPage.h"
#import "AWPPhotoGaleryPage.h"
#import "AWPContactPage.h"
#import "AWPNetworkPage.h"
#import "AWPVideoPage.h"
#import "AWPPhotoTxtGridListPage.h"
#import "AWPPageViewController.h"
#import "AWPCatalogoPage.h"

@implementation AWPMenu

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {

    if (self = [super initWithDictionary:dictionary]) {
        _title = [self.internalData objectForKey:@"title"];
        _subtitle = [self.internalData objectForKey:@"subtitle"];
        _icon = [self.internalData objectForKey:@"icon"];
        _gradient_orientation = [self.internalData objectForKey:@"gradient_orientation"];
        _text_color = [self.internalData objectForKey:@"text_color"];
        _background =  [[AWPBackground alloc] initWithBackgroundString: [self.internalData objectForKey:@"background"]];
        NSMutableDictionary* pagesMutable = [NSMutableDictionary dictionary];
        
        AWPPage *pageObject;
        NSArray* pagesArr = [self.internalData objectForKey:@"pages"];
        NSMutableArray* indices = [NSMutableArray array];
        for (int i=0; i<pagesArr.count; i++) {
            NSDictionary* pageDict = pagesArr[i];
            AWPType *type = [[AWPType alloc] initWithDictionary: [pageDict objectForKey:@"type"]];
            switch (type.typeValue) {
                case type_text:
                    pageObject = [[AWPTextPage alloc] initWithDictionary:pageDict];
                    break;
                case type_image:
                    pageObject = [[AWPImagePage alloc] initWithDictionary:pageDict];
                    break;
                case type_photo_galery:
                    pageObject = [[AWPPhotoGaleryPage alloc] initWithDictionary:pageDict];
                    break;
                case type_contact:
                    pageObject = [[AWPContactPage alloc] initWithDictionary:pageDict];
                    break;
                case type_network:
                    pageObject = [[AWPNetworkPage alloc] initWithDictionary:pageDict];
                    break;
                case type_video:
                    pageObject = [[AWPVideoPage alloc] initWithDictionary:pageDict];
                    break;
                case type_photo_txt_grid_list:
                    pageObject = [[AWPPhotoTxtGridListPage alloc] initWithDictionary:pageDict];
                    break;
                case type_catalogo:
                    pageObject = [[AWPCatalogoPage alloc] initWithDictionary:pageDict];
                    break;
                default:
                break;
            }
            if (pageObject) {
                @try {
                    UIViewController* pageVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:pageObject.layout];
                    if ([pageVC isKindOfClass:[AWPPageViewController class]])
                    {
                        [pagesMutable setObject:pageObject forKey:pageObject.pos];
                        [indices addObject:pageObject.pos];
                    }
                }
                @catch (NSException *exception) {
                    NSLog(@"Layout doesn't exits: %@", exception.description);
                }

            }
        }
        _pagesIndex = [NSArray arrayWithArray:indices];
        _pages = [NSDictionary dictionaryWithDictionary:pagesMutable];
    }
    return self;
}

@end
