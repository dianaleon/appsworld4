//
//  AWPMainViewController.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/13/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWPPageViewController.h"
#import "MIHGradientView.h"
//#import "GRKGradientView.h"

@interface AWPMainViewController : UIViewController <AWPPageViewControllerDelegate, AWPPortfolioManagerDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
//@property (weak, nonatomic) IBOutlet GRKGradientView *menuButtonGradientBackground;
//@property (weak, nonatomic) IBOutlet MIHGradientView *menuButtonGradientBackground;

@property (weak, nonatomic) IBOutlet MIHGradientView *bgMenu;

@end
