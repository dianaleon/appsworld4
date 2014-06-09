//
//  AWPMainViewController.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/13/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPMainViewController.h"
#import "AWPMenuViewController.h"
#import "AWPPageViewController.h"
#import "AWPPortfolioManager.h"
#import "UIColor+ColorWithHex.h"
#import <QuartzCore/QuartzCore.h>

@interface AWPMainViewController ()
{
    BOOL menuIsShown;
}
@property AWPPageViewController* previousSubView;
@property AWPPageViewController* currentSubView;

@end

@implementation AWPMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        menuIsShown = NO;
    }
    return self;
}

- (IBAction)menuButtonTouch:(id)sender {
    if (menuIsShown) {
        [self hideMenu];
    } else {
        [self showMenu];
    }
}

- (void)showMenu {
    self.previousSubView = self.currentSubView;
    AWPMenuViewController* menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuVC"];
    [self changeToPage:menuVC];
    menuIsShown = YES;
}

-(void)hideMenu {
    CATransition *bottomTransition=[CATransition animation];
    bottomTransition.duration=0.25;
    bottomTransition.type=kCATransitionPush;
    bottomTransition.subtype=kCATransitionFromBottom;
    
    [self changeToPage:self.previousSubView withTransition:bottomTransition];
    menuIsShown = NO;
}


-(void)changeToPage:(AWPPageViewController *)page {
    CATransition *topTransition=[CATransition animation];
    topTransition.duration=0.3;
    topTransition.type=kCATransitionMoveIn;
    topTransition.subtype=kCATransitionFromTop;

    [self changeToPage:page withTransition:topTransition];
}

-(void)changeToPage:(AWPPageViewController *)page withTransition:(CATransition*)transition
{
    NSLog(@"Entering page: %@", [page description]);
    page.delegate = self;

    [self flipFromViewController:_currentSubView toViewController:page withDirection:0 andTransition:transition];
    menuIsShown = NO;
}

- (void) flipFromViewController:(AWPPageViewController*) fromController
               toViewController:(AWPPageViewController*) toController
                  withDirection:(UIViewAnimationOptions) direction
                  andTransition:(CATransition*)transition
{
    toController.view.frame = fromController.view.bounds;                           //  1
    [self addChildViewController:toController];                                     //
    [fromController willMoveToParentViewController:nil];                            //
    
    
    [self transitionFromViewController:fromController
                      toViewController:toController
                              duration:0.2
                               options:direction | UIViewAnimationOptionCurveEaseIn
                            animations:^{
                                [self.view.layer addAnimation:transition forKey:nil];
                            }
                            completion:^(BOOL finished) {
                                self.currentSubView = toController;
                                [toController didMoveToParentViewController:self];  //  2
                                [fromController removeFromParentViewController];    //  3
                            }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[AWPPortfolioManager sharedManager] getPortfolioAsync:self];
    
    
    
    self.bgMenu.startPoint = CGPointMake(0.0, 0.0);
    self.bgMenu.endPoint = CGPointMake(1.0, 1.0);
    self.bgMenu.startColor =[UIColor colorWithHexString:@"775728" andAlpha:1 ];
    self.bgMenu.endColor =[UIColor colorWithHexString:@"D0B36A"  andAlpha:1];
    
    

}

- (void)portfolioReady:(AWPPortfolio *)portfolio
{
    [self launchFirstPage:portfolio];
}

- (void)portfolioError:(NSError *)error
{
    NSLog(@"ERROR al cargar el json de portfolio.");
}

- (void)launchFirstPage:(AWPPortfolio *)portfolio
{
    AWPPageViewController* imagePageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"image"];
    
    NSDictionary* pages = portfolio.pages;
    AWPPage* page = [pages objectForKey:@"3"];
    imagePageVC.page = page;
    [self addChildViewController:imagePageVC];
    imagePageVC.view.frame = _containerView.bounds;
    [_containerView addSubview:imagePageVC.view];
    
    [imagePageVC didMoveToParentViewController:self];
    self.currentSubView = imagePageVC;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
