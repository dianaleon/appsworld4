//
//  AWPPhotoGridPageViewController.h
//  portfolio
//
//  Created by diana leon on 4/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageViewController.h"
#import "MIHGradientView.h"

@interface AWPPhotoGridPageViewController : AWPPageViewController
@property (weak, nonatomic) IBOutlet UILabel *tituloApp;
@property (weak, nonatomic) IBOutlet UILabel *subtituloApp;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgHeader;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgBody;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitle;

@property (weak, nonatomic) IBOutlet UIImageView *imageContent;

@property (weak, nonatomic) IBOutlet UILabel *titlePage;
@property (weak, nonatomic) IBOutlet UILabel *textPage;




@end
