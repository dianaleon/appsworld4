//
//  AWPGetAppById.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/10/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPBaseWebService.h"

@interface AWPGetAppById : AWPBaseWebService
@property (nonatomic, assign) int id_app;
@property (nonatomic, copy) NSString *lectura;
@end
