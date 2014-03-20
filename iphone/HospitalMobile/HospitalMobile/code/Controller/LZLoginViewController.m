//
//  LZLoginViewController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-14.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZLoginViewController.h"
#import "LZSignUpViewController.h"
#import "LZDemoData.h"
#import "LZMainTabBarController.h"

@interface LZLoginViewController ()

@end

@implementation LZLoginViewController

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
    self.navigationItem.title = @"登录";
    self.tfPassword.secureTextEntry = true;
    [self.navigationItem setHidesBackButton:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoginTouchUpInside:(id)sender {
    [LZDemoData singleton].isLogined = YES;
    LZMainTabBarController *tabBarController = (LZMainTabBarController *)self.navigationController.parentViewController;
    tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnSignupTouchUpInside:(id)sender {
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LZSignUpViewController * SignUpViewController = [sboard instantiateViewControllerWithIdentifier:@"LZSignUpViewController"];
    SignUpViewController.title = @"注册";
    [self.navigationController pushViewController:SignUpViewController animated:YES];
}
@end
