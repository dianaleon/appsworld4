//
//  AWPViewController.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/6/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWPPageViewController.h"
#import "MIHGradientView.h"
@interface AWPMenuViewController : AWPPageViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIImageView *imageTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageHome;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *tituloApp;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgHeader;
@property (weak, nonatomic) IBOutlet UILabel *subtituloApp;

@end
