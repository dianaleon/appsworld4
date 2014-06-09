//
//  AWPPage.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/11/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPBaseModel.h"
#import "AWPType.h"

@interface AWPPage : AWPBaseModel
{
//    NSString* _identifier;
    NSMutableArray* _objects;
}
@property (nonatomic, readonly) AWPType* type;
@property (nonatomic, readonly) NSString* iconURL;
@property (nonatomic, readonly) NSString* pos;
@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSString* content;

@property (nonatomic, readonly) NSArray* objects;
@property (nonatomic, readonly) NSString* layout;

@end
