//
//  AWPImagePageViewController.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/14/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPImagePageViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "AWPImagePage.h"
#import "AWPNetworkObject.h"

@interface AWPImagePageViewController ()
@end

@implementation AWPImagePageViewController

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
    
//    [self.imageView setImageWithURL:[NSURL URLWithString:@"http://surflorida.com/wp-content/uploads/2012/08/Abogados.jpg"]];

    for (AWPPageObject* content in self.page.objects) {
        if (content.type == object_type_image) {
            [self.imageView setImageWithURL:[NSURL URLWithString:((AWPImageObject*)content).content]];
        }
        if (content.type == object_type_text) {
            [self.imageView setImageWithURL:[NSURL URLWithString:((AWPTextObject*)content).content]];
        }
        if (content.type == object_type_network) {
            [self.imageView setImageWithURL:[NSURL URLWithString:((AWPNetworkObject*)content).content]];
            //.content o el campo que venga del json.
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
