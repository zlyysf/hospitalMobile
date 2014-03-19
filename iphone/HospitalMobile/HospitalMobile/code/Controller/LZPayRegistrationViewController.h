//
//  LZPayRegistrationViewController.h
//  HospitalMobile
//
//  Created by Yasofon on 14-3-19.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZPayRegistrationViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UILabel *labelDepartment;

@property (weak, nonatomic) IBOutlet UILabel *labelDoctor;

@property (weak, nonatomic) IBOutlet UIButton *buttonPay;



- (IBAction)btnPayTouchUpInside:(id)sender;




@property (strong,nonatomic)NSDictionary *registrationDict;

@end
