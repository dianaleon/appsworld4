//
//  AWPContactPageViewController.m
//  portfolio
//
//  Created by diana leon on 4/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPContactPageViewController.h"
#import "AWPContactPage.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import "AWPContactObject.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

#import "AWPMenuViewController.h"
#import "RZTelprompt.h"
#import "CGLMailHelper.h"

@interface AWPContactPageViewController ()
@property (nonatomic, assign) AWPMenu* menu;
@end

@implementation AWPContactPageViewController

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
    
//    AWPContactPage* cPage = (AWPContactPage*)self.page;
    
    //se rellena el titulo y subtitulo de la app
    self.tituloApp.text = self.menu.title;
    self.subtituloApp.text = self.menu.subtitle;
    
    
    //FUENTES
    [self.tituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:24]];
    [self.subtituloApp setFont:[UIFont fontWithName:@"CopperplateGothicStd-29AB" size:14]];
    
    //gradiente proviene del json
    self.bgHeader.startPoint = CGPointMake(0.0, 0.0);
    self.bgHeader.endPoint = CGPointMake(1.0, 1.0);
    self.bgHeader.startColor =[UIColor colorWithHexString: self.menu.background.bgStartColor andAlpha:1 ];
    self.bgHeader.endColor =[UIColor colorWithHexString: self.menu.background.bgEndColor  andAlpha:1];
    
//    AWPContactObject* cObj = [cPage.objects objectAtIndex:0];
    

}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    AWPContactPage* cPage = (AWPContactPage*)self.page;
    return cPage.objects.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AWPContactPage* cPage = (AWPContactPage*)self.page;
    AWPContactObject* tObj = [cPage.objects objectAtIndex:indexPath.row];
    
    NSString* cellIdentifier = @"ContactCollectionCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    
    
    //gradiente
    MIHGradientView *grad = (MIHGradientView*)[cell viewWithTag:1];
    grad.startPoint = CGPointMake(0.0, 0.0);
    grad.endPoint = CGPointMake(1.0, 1.0);
    grad.startColor =[UIColor colorWithHexString: cPage.type.background.bgStartColor andAlpha:1 ];
    grad.endColor =[UIColor colorWithHexString: cPage.type.background.bgEndColor  andAlpha:1];
    
    UILabel *titulo = (UILabel*)[cell viewWithTag:2];
    titulo.text = tObj.content;
    [titulo setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:18]];
    UITapGestureRecognizer *tapGesture=nil;
    NSString* subtype = [tObj.subtype lowercaseString];
    if ([subtype isEqualToString:@"telefono"]) {
        tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(telTouched:)];
    } else if ([subtype isEqualToString:@"email"]) {
        tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emailTouched:)];
    } else if ([subtype isEqualToString:@"web"]) {
        tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webTouched:)];
    }
    [grad addGestureRecognizer:tapGesture];
    
    return cell;
    
    
}


- (void)telTouched:(UITapGestureRecognizer*)sender
{
    MIHGradientView *grad = (MIHGradientView*)sender.view;
    UILabel *telLabel = (UILabel*)[grad viewWithTag:2];
    NSString* telNumber = [telLabel.text stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    [RZTelprompt callWithString:telNumber];
}

- (void)emailTouched:(UITapGestureRecognizer*)sender
{
    MIHGradientView *grad = (MIHGradientView*)sender.view;
    UILabel *emailLabel = (UILabel*)[grad viewWithTag:2];

    UIViewController *mailVC = [CGLMailHelper mailViewControllerWithRecipients:@[emailLabel.text]
                                                                       subject:@""
                                                                       message:@""
                                                                        isHTML:NO
                                                                includeAppInfo:NO
                                                                    completion:^(NSString *result, NSError *error) {
                                                                        if (error) {
                                                                            NSLog(@"Error: %@", [error localizedDescription]);
                                                                        } else {
                                                                            NSLog(@"Result: %@",result);
                                                                        }
                                                                    }];

    [self presentViewController:mailVC animated:YES completion:nil];
}

- (void)webTouched:(UITapGestureRecognizer*)sender
{
    MIHGradientView *grad = (MIHGradientView*)sender.view;
    UILabel *webLabel = (UILabel*)[grad viewWithTag:2];
    NSString* webStringURL = [webLabel.text stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];


    NSURL * url = [NSURL URLWithString:webStringURL];
    if (![[url scheme] length])
    {
        url = [NSURL URLWithString:[@"http://" stringByAppendingString:webStringURL]];
    }
    [[UIApplication sharedApplication] openURL:url];
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
