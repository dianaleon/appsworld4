//
//  AWPPageViewController.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/14/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageViewController.h"

@interface AWPPageViewController ()
@end

@implementation AWPPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homeTouched:(id)sender {
    @try {
        AWPPageViewController* pageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"image"];
        
        [self.delegate changeToPage:pageVC];
    }
    @catch (NSException *exception) {
        NSLog(@"Layout doesn't exits: %@", exception.description);
    }
}

@end
