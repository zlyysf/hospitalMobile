//
//  LZCTAViewController.m
//  HospitalMobile
//
//  Created by Chenglei Shen on 3/14/14.
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import "LZCTAViewController.h"

@interface LZCTAViewController ()
@property (strong, nonatomic) PhotoShowView *photoShowView;
@property (assign, nonatomic) BOOL photoFullShow;
@end

@implementation LZCTAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PhotoShowView *photoShowView = [[PhotoShowView alloc] initWithFrame:self.view.bounds];
    photoShowView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    photoShowView.image = self.ctaImage;
    [photoShowView.oneTap addTarget:self action:@selector(photoShowViewTap:)];
    [self.view addSubview:photoShowView];
    self.photoShowView = photoShowView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"cancel" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemTap:)];
    self.photoFullShow = YES;
}

- (void)setCtaImage:(UIImage *)ctaImage
{
    if (_ctaImage == ctaImage) return;
    
    _ctaImage = ctaImage;
    
    if ([self isViewLoaded]) {
        self.photoShowView.image = ctaImage;
    }
}

#pragma mark -

- (BOOL)photoFullShow {
    return self.navigationController.navigationBar.hidden;
}

- (void)setPhotoFullShow:(BOOL)photoFullShow {
    
    [[UIApplication sharedApplication] setStatusBarHidden:photoFullShow withAnimation:UIStatusBarAnimationFade];
    [self.navigationController setNavigationBarHidden:photoFullShow];
}


#pragma mark -
#pragma mark Tap
- (void)leftBarButtonItemTap:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)photoShowViewTap:(id)sender
{
    self.photoFullShow = !self.photoFullShow;
}

@end
