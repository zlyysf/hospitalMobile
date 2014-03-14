//
//  LZSignUpViewController.h
//  HospitalMobile
//
//  Created by Yasofon on 14-3-14.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZSignUpViewController : UIViewController



@property (weak, nonatomic) IBOutlet UITextField *tfIdentityNO;


@property (weak, nonatomic) IBOutlet UITextField *tfName;



@property (weak, nonatomic) IBOutlet UITextField *tfPassword;



- (IBAction)btnSignUpTouchUpInside:(id)sender;



@end








