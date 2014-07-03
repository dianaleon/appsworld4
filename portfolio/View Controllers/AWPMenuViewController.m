//
//  AWPViewController.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/6/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPMenuViewController.h"
#import "AWPImagePageViewController.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import "AWPMenuCollectionViewCell.h"

@interface AWPMenuViewController ()

@property (nonatomic, assign) AWPMenu* menu;

@end

@implementation AWPMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MainMenuItemCell"];
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    self.menu = pfMan.portfolio.menu;
    //self.view.backgroundColor = [UIColor colorWithHexString:self.menu. andAlpha:1.0];
	
    //self.imageHome = self.menu.title;
    
    
    //GUILLE hay que poner la imagen del titulo "menu": { "home_img": "....",!!!!!
    //self.imageHome = self.menu.home_img;
    //GUILLE hay que poner la imagen del titulo "menu": {  "title_img": "....",!!!!
    //self.imageTitle = self.menu.title_img;
   
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    AWPMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainMenuItemCell" forIndexPath:indexPath];
    AWPPage* page =[self.menu.pages objectForKey: self.menu.pagesIndex[indexPath.row]];
//    NSString* hexColor = page.type.background;
//    
//    cell.backgroundColor = [UIColor colorWithHexString:hexColor andAlpha:1.0];
    
    
    cell.label.text = page.title;
    //FUENTES
    
    [cell.label setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:20]];
   
    //falta gradientes
    cell.label.textColor = [UIColor colorWithHexString:self.menu.text_color andAlpha:1.0];
    //seteado estatico de prueba

    
    cell.label.layer.backgroundColor = [UIColor colorWithHexString: @"#231B10"  andAlpha:1].CGColor;
    
    //prueba bordes
    cell.label.layer.borderWidth =.8f;
    cell.label.layer.borderColor = [UIColor colorWithHexString:@"#998756" andAlpha:1.0].CGColor;
    


//    switch ( indexPath.row % 3) {
//        case 0:
//            cell.backgroundColor = [UIColor redColor];
//
//            break;
//        case 1:
//            cell.backgroundColor = [UIColor blueColor];
//            break;
//            
//            case 2:
//            cell.backgroundColor = [UIColor greenColor];
//            break;
//        default:
//            break;
//    }
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return self.menu.pages.count;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AWPPage* page =[self.menu.pages objectForKey: self.menu.pagesIndex[indexPath.row]];
    @try {
        AWPPageViewController* pageVC = [self.storyboard instantiateViewControllerWithIdentifier:page.layout];
        pageVC.page = page;
        
        [self.delegate changeToPage:pageVC];
    }
    @catch (NSException *exception) {
        NSLog(@"Layout doesn't exits: %@", exception.description);
    }
}
@end
