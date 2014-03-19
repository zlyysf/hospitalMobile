//
//  LZRegisterTableViewController.h
//  HospitalMobile
//
//  Created by Chenglei Shen on 3/14/14.
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZRegisterTableViewController : UITableViewController

@property (nonatomic, strong) NSDictionary *registrationInfo;
//@property (nonatomic, strong) NSString *department;


- (IBAction)buttonDoctorInfoInCellTouchUpInside:(id)sender;

- (IBAction)buttonRegisterInCellTouchUpInside:(id)sender;

@end
