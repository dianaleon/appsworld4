//
//  AWPBackground.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/21/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AWPBackground : NSObject
@property (nonatomic, readonly) NSString* background;
@property (nonatomic, readonly) NSString* bgStartColor;
@property (nonatomic, readonly) NSString* bgEndColor;
@property (nonatomic, readonly) int bgGradientAngle;

-(instancetype)initWithBackgroundString:(NSString*)background;

@end
