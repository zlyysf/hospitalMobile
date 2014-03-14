//
//  LZLoginViewController.h
//  HospitalMobile
//
//  Created by Yasofon on 14-3-14.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZLoginViewController : UIViewController



@property (weak, nonatomic) IBOutlet UITextField *tfIdentityNO;



@property (weak, nonatomic) IBOutlet UITextField *tfPassword;



- (IBAction)btnLoginTouchUpInside:(id)sender;


- (IBAction)btnSignupTouchUpInside:(id)sender;

@end










