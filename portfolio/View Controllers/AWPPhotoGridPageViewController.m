//
//  AWPPhotoGridPageViewController.m
//  portfolio
//
//  Created by diana leon on 4/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPhotoGridPageViewController.h"
#import "AWPPhotoGaleryPage.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import "AWPImageObject.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

#import "AWPMenuViewController.h"
//json: photo_grid
@interface AWPPhotoGridPageViewController ()
@property (nonatomic, assign) AWPMenu* menu;
@end

@implementation AWPPhotoGridPageViewController

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
    AWPPhotoGaleryPage * pgPage = (AWPPhotoGaleryPage*)self.page;
    //datos del menu
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    self.menu = pfMan.portfolio.menu;
    
    //se rellena el titulo y subtitulo de la app
    self.tituloApp.text = self.menu.title;
    self.subtituloApp.text = self.menu.subtitle;
    //FUENTES
    [self.tituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:24]];
    self.tituloApp.textColor = [UIColor colorWithHexString: @"ffffff"  andAlpha:1];
    [self.subtituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-29AB" size:14]];
    self.subtituloApp.textColor = [UIColor colorWithHexString: @"000000"  andAlpha:1];
    

   
    //GRADIENTES proviene del json
    
    //HEADER GRADIENTE
    self.bgHeader.startPoint = CGPointMake(0.0, 0.0);
    self.bgHeader.endPoint = CGPointMake(1.0, 1.0);
    
    //gradiente proviene del json
    self.bgHeader.startColor = [UIColor colorWithHexString: self.menu.background.bgStartColor andAlpha:1 ];
    self.bgHeader.endColor = [UIColor colorWithHexString: self.menu.background.bgEndColor  andAlpha:1];
    
    //TITULO GRADIENTE
    self.bgTitle.startPoint = CGPointMake(0.0, 0.0);
    self.bgTitle.endPoint = CGPointMake(1.0, 1.0);
    self.bgTitle.startColor = [UIColor colorWithHexString: pgPage.type.background.bgStartColor andAlpha:1 ];
    self.bgTitle.endColor = [UIColor colorWithHexString: pgPage.type.background.bgEndColor andAlpha:1];
    
  
    //BODY GRADIENTE
    self.bgBody.startPoint = CGPointMake(0.0, 0.0);
    self.bgBody.endPoint = CGPointMake(1.0, 1.0);
    self.bgBody.startColor =[UIColor colorWithHexString: @"#000000" andAlpha:1 ];
    self.bgBody.endColor =[UIColor colorWithHexString: @"#000000"   andAlpha:1];
    
    //CONTENIDOS
    //imagen
    AWPImageObject* iObj = [pgPage.objects objectAtIndex:0];
    
   [self.imageContent setImageWithURL:[NSURL URLWithString:iObj.content_img]];
    self.titlePage.text = iObj.title;
    self.textPage.text = iObj.content;
//!!!    self.textPage.textColor = iObj.textColor;
    
    
   [self.titlePage setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:20]];

    
    
    

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
