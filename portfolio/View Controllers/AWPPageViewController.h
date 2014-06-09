//
//  AWPPageViewController.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/14/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWPPage.h"

@class AWPPageViewController;

@protocol AWPPageViewControllerDelegate <NSObject>

- (void) changeToPage:(AWPPageViewController*) page;

@end

@interface AWPPageViewController : UIViewController
@property id <AWPPageViewControllerDelegate> delegate;
@property (nonatomic, strong) AWPPage* page;
- (IBAction)homeTouched:(id)sender;
@end

