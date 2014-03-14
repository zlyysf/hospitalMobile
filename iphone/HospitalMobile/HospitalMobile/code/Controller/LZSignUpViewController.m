//
//  LZSignUpViewController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-14.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZSignUpViewController.h"

@interface LZSignUpViewController ()

@end

@implementation LZSignUpViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSignUpTouchUpInside:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}
@end
