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


- (IBAction)buttonDoctorInfoInCellTouchUpInside:(id)sender;


@end
