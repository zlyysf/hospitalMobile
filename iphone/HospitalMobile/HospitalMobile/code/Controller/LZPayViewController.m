//
//  LZPayViewController.m
//  HospitalMobile
//
//  Created by Chenglei Shen on 3/14/14.
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import "LZPayViewController.h"

@interface LZPayViewController () <UIAlertViewDelegate>

@end

@implementation LZPayViewController

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
    self.navigationItem.title = @"挂号";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.passwordField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.passwordField resignFirstResponder];
    NSString *alertMessage = [NSString stringWithFormat:@"缴费成功，您的挂号顺序为12，目前已看到4号，估计等待时间为60分钟"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:alertMessage
                                                   delegate:self
                                          cancelButtonTitle:@"确认"
                                          otherButtonTitles:nil];
    [alert show];
    
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    [self dismissViewControllerAnimated:YES completion:NO];
    [self.navigationController popViewControllerAnimated:true];

}


@end
