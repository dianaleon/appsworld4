//
//  AWPNetworksViewController.m
//  portfolio
//
//  Created by diana leon on 4/1/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPNetworksViewController.h"
#import "AWPNetworkPage.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import "AWPNetworkObject.h"

#import "AWPMenuViewController.h"


@interface AWPNetworksViewController ()
@property (nonatomic, assign) AWPMenu* menu;
@end

@implementation AWPNetworksViewController

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
    
//    AWPNetworkPage* nPage = (AWPNetworkPage*)self.page;

    //se rellena el titulo y subtitulo de la app
    self.tituloApp.text = self.menu.title;
    self.subtituloApp.text = self.menu.subtitle;
    
    //FUENTES
    [self.tituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:24]];
    self.tituloApp.textColor = [UIColor colorWithHexString: @"ffffff"  andAlpha:1];
    [self.subtituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-29AB" size:14]];
    self.subtituloApp.textColor = [UIColor colorWithHexString: @"000000"  andAlpha:1];
    

    
    //gradiente proviene del json
    self.bgHeader.startPoint = CGPointMake(0.0, 0.0);
    self.bgHeader.endPoint = CGPointMake(1.0, 1.0);
    self.bgHeader.startColor =[UIColor colorWithHexString: self.menu.background.bgStartColor andAlpha:1 ];
    self.bgHeader.endColor =[UIColor colorWithHexString: self.menu.background.bgEndColor  andAlpha:1];
    

    
    
    //Generar la {imagen + url} de acuerdo a las redes sociales que vengan en el json
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    AWPNetworkPage* nPage = (AWPNetworkPage*)self.page;
    return nPage.objects.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AWPNetworkPage* nPage = (AWPNetworkPage*)self.page;
    AWPNetworkObject* netObj = [nPage.objects objectAtIndex:indexPath.row];

    NSString* cellIdentifier = @"NetworksCollectionCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSString* content = [netObj.subtype lowercaseString]; //tipo
    NSString* imageName = @"fb.png";
    NSString* imageSelectedName = @"fb_hover.png";
//    NSString* urlNetwork = [netObj.content lowercaseString];

    if ([content isEqualToString:@"facebook"])
    {
        imageName = @"fb.png";
        imageSelectedName = @"fb_hover.png";
    }
    else if ([content isEqualToString:@"twitter"])
    {
        imageName = @"twitter.png";
        imageSelectedName = @"twitter_hover.png";
    }
    else if ([content isEqualToString:@"linkedin"])
    {
        imageName = @"linkedin.png";
        imageSelectedName = @"linkedin_hover.png";
    }
    else if ([content isEqualToString:@"gplus"])
    {
        imageName = @"g+.png";
        imageSelectedName = @"g+_hover.png";
    }
    else if ([content isEqualToString:@"pinterest"])
    {
        imageName = @"pinterest.png";
        imageSelectedName = @"pinterest_hover.png";
    }
    else if ([content isEqualToString:@"instagram"])
    {
        imageName = @"instagram.png";
        imageSelectedName = @"instagram_hover.png";
    }
 
    
    
    UIButton *button = (UIButton*)[cell viewWithTag:3];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageSelectedName] forState:UIControlStateSelected];
    button.tag = indexPath.row; // urlNetwork: como seteo la url a la cual tiene que redirigir
    return cell;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (self.page.objects.count == 1) {
        CGFloat newWidth = (self.collectionView.bounds.size.width);
        return UIEdgeInsetsMake(0, (newWidth / 2), 0, (newWidth/2));
    } else if ((self.page.objects.count == 2)||(self.page.objects.count == 4)) {
        CGFloat newWidth = (self.collectionView.bounds.size.width-150);
        return UIEdgeInsetsMake(0, (newWidth / 2), 0, (newWidth/2));
    } else {
        return UIEdgeInsetsMake(0, 20, 0, 20); // top, left, bottom, right
    }
}


- (IBAction)networkButtonTouched:(UIButton*)sender {
    AWPNetworkObject* netObj = [self.page.objects objectAtIndex:sender.tag];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: netObj.content]];
}


@end











