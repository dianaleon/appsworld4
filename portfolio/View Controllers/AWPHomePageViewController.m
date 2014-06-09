//
//  AWPHomePageViewController.m
//  portfolio
//
//  Created by diana leon on 3/31/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPHomePageViewController.h"
#import "AWPImagePage.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import "AWPImageObject.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

#import "AWPMenuViewController.h"

@interface AWPHomePageViewController ()
@property (nonatomic, assign) AWPMenu* menu;
@end

@implementation AWPHomePageViewController



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

    //datos del menu
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    self.menu = pfMan.portfolio.menu;
    
    
	//CONTENIDO
//    AWPImagePage* iPage = (AWPImagePage*)self.page;
    //se rellena el titulo y subtitulo de la app
    self.tituloApp.text = self.menu.title;
    self.subtituloApp.text = self.menu.subtitle;
    //FUENTES
    [self.tituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:24]];
    self.tituloApp.textColor = [UIColor colorWithHexString: @"FFFFFF"  andAlpha:1];
    [self.subtituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-29AB" size:14]];
    self.subtituloApp.textColor = [UIColor colorWithHexString: @"000000"  andAlpha:1];
    

    // relleno de la pagina con la imagen de la home (objeto del json)
//    AWPImageObject* iObj = [iPage.objects objectAtIndex:0];
//    [self.imagePage setImageWithURL:[NSURL URLWithString:iObj.content_img]];
    NSString* home_img = pfMan.portfolio.theme.homeImage;
    [self.imagePage setImageWithURL:[NSURL URLWithString:home_img]];
    
    //GRADIENTES Y COLORES (ESTILOS)
    //gradiente proviene del json
    self.bgHeader.startPoint = CGPointMake(0.0, 0.0);
    self.bgHeader.endPoint = CGPointMake(1.0, 1.0);
    self.bgHeader.startColor =[UIColor colorWithHexString: self.menu.background.bgStartColor andAlpha:1 ];
    self.bgHeader.endColor =[UIColor colorWithHexString: self.menu.background.bgEndColor andAlpha:1];
    
    
    
    


    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
