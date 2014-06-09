//
//  AWPType.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPBaseModel.h"
#import "AWPBackground.h"

typedef enum
{
    type_text = 1,
	type_photo_galery = 2,
	type_contact = 3,
	type_network = 4,
	type_video = 5,
	type_image = 6,
    type_catalogo = 7,
    
	//NUEVAS PAGINAS
	type_photo_txt_grid_list = 8,
	type_photo_text = 9,
	type_txt_photo_txt = 10,
	type_horizontal_txt_photo_list = 11,
	type_curriculum = 12,
	type_photos_grid = 13
} AWPTypeValue;

@interface AWPType : AWPBaseModel
@property (nonatomic, readonly) NSString* type;
@property (nonatomic, readonly) AWPBackground* background;
@property (nonatomic, readonly) AWPTypeValue typeValue;

@end
