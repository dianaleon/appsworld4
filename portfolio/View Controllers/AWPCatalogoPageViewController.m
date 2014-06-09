//
//  AWPCatalogoPageViewController.m
//  portfolio
//
//  Created by diana leon on 4/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPCatalogoPageViewController.h"
#import "AWPCatalogoPage.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import "AWPCatalogoObject.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

#import "AWPMenuViewController.h"

@interface AWPCatalogoPageViewController ()

@property (nonatomic, assign) AWPMenu* menu;

@end

@implementation AWPCatalogoPageViewController

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
    
    
    
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    AWPCatalogoPage* cPage = (AWPCatalogoPage*)self.page;
    return cPage.objects.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AWPCatalogoPage* cPage = (AWPCatalogoPage*)self.page;
    AWPTextObject* tObj = [cPage.objects objectAtIndex:indexPath.row];
    
    NSString* cellIdentifier = @"CatalogoCollectionCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    
    
    //gradiente celda
    MIHGradientView *grad = (MIHGradientView*)[cell viewWithTag:4];
    grad.startPoint = CGPointMake(0.0, 0.0);
    grad.endPoint = CGPointMake(1.0, 1.0);
    
    grad.startColor = [UIColor colorWithHexString: cPage.type.background.bgStartColor  andAlpha:1 ];
    grad.endColor = [UIColor colorWithHexString: cPage.type.background.bgEndColor   andAlpha:1];
    
    //imagen
    UIImageView *imagen = (UIImageView*)[cell viewWithTag:1];
    [imagen setImageWithURL:[NSURL URLWithString:tObj.content_img]];
    //titulo
    UILabel *titulo = (UILabel*)[cell viewWithTag:2];
    titulo.text = tObj.title;
    [titulo setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:14]];
    //texto
    UILabel *texto = (UILabel*)[cell viewWithTag:3];
    texto.text = tObj.content;
    
  
    return cell;
    
   
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //datos del menu
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    self.menu = pfMan.portfolio.menu;
    
    
    NSString* headerIdentitier = @"HeaderView";

    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentitier forIndexPath:indexPath];
        
//        AWPCatalogoPage * cPage = (AWPCatalogoPage*)self.page;
        
        //TITULO HEADER
        UILabel *tituloApp = (UILabel*)[headerView viewWithTag:1];
        tituloApp.text = self.menu.title;
       
        
        //SUBTITULO HEADER
        UILabel *subtituloApp = (UILabel*)[headerView viewWithTag:2];
        subtituloApp.text = self.menu.subtitle;
       
      
        //FUENTES
        [tituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:24]];
        tituloApp.textColor = [UIColor colorWithHexString: @"ffffff"  andAlpha:1];
        //EL SUBTITULO ES SIEMPRE NEGRO (no hay campo en el json)
        [subtituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-29AB" size:14]];
        subtituloApp.textColor = [UIColor colorWithHexString: @"000000"  andAlpha:1];
        
        //GRADIENTES Y COLORES (ESTILOS)
        //Header
        MIHGradientView *bgHeader = (MIHGradientView*)[headerView viewWithTag:3];
        bgHeader.startPoint = CGPointMake(0.0, 0.0);
        bgHeader.endPoint = CGPointMake(1.0, 1.0);
        bgHeader.startColor =[UIColor colorWithHexString: self.menu.background.bgStartColor andAlpha:1 ];
        bgHeader.endColor =[UIColor colorWithHexString: self.menu.background.bgEndColor  andAlpha:1];

        UITapGestureRecognizer *tapHome=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(homeTouched:)];
        [headerView addGestureRecognizer:tapHome];

        
        reusableview = headerView;
    }

    return reusableview;
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
