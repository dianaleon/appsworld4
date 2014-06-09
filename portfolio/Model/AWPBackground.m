//
//  AWPBackground.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/21/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPBackground.h"

@implementation AWPBackground

-(instancetype)initWithBackgroundString:(NSString*)background
{
    if (self = [super init]) {
        _background = background;
    }
    return self;
}

- (NSString *)bgStartColor
{
    NSString* colors = self.background;
    NSMutableArray *gradientData = [NSMutableArray arrayWithArray: [colors componentsSeparatedByString:@";"]];
    NSString* startColor = @"#FFFFFF";
    if (gradientData.count>0) {
        startColor = [gradientData objectAtIndex:0];
    }
    return startColor;
    
}

- (NSString *)bgEndColor
{
    NSString* colors = self.background;
    NSMutableArray *gradientData = [NSMutableArray arrayWithArray: [colors componentsSeparatedByString:@";"]];
    NSString* endColor = @"#FFFFFF";
    
    if (gradientData.count>1) {
        endColor = [gradientData objectAtIndex:1];
    } else {
        endColor = self.bgStartColor;
    }
    
    return endColor;
}

- (int)bgGradientAngle
{
    NSString* colors = self.background;
    NSMutableArray *gradientData = [NSMutableArray arrayWithArray: [colors componentsSeparatedByString:@";"]];
    
    int gradientAngle = 135;
    if (gradientData.count==3) {
        gradientAngle = [[gradientData objectAtIndex:2] intValue];
    }
    
    return gradientAngle;
}

@end
