//
//  LZRegisterAtHospitalViewController.h
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZRegisterAtHospitalViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView1;

- (IBAction)btnRegisterTouchUpInside:(id)sender;

@end
