//
//  AWPContactPageViewController.h
//  portfolio
//
//  Created by diana leon on 4/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageViewController.h"
#import "MIHGradientView.h"

@interface AWPContactPageViewController : AWPPageViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *tituloApp;
@property (weak, nonatomic) IBOutlet UILabel *subtituloApp;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgHeader;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end
