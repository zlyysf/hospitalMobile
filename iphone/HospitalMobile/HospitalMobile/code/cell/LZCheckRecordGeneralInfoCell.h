//
//  LZCheckRecordGeneralInfoCell.h
//  HospitalMobile
//
//  Created by Yasofon on 14-3-13.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZCheckRecordGeneralInfoCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *labelCheckTime;

@property (weak, nonatomic) IBOutlet UILabel *labelCheckCode;

@property (weak, nonatomic) IBOutlet UILabel *labelCheckType;


@property (weak, nonatomic) IBOutlet UILabel *labelCheckPosition;

@property (weak, nonatomic) IBOutlet UILabel *labelApplyDepartment;


@property (weak, nonatomic) IBOutlet UILabel *labelCheckWay;

@property (weak, nonatomic) IBOutlet UILabel *labelCheckState;


@property (weak, nonatomic) IBOutlet UILabel *labelReportTime;

@property (weak, nonatomic) IBOutlet UILabel *labelReporter;


@property (weak, nonatomic) IBOutlet UILabel *labelAuditor;

@property (weak, nonatomic) IBOutlet UILabel *labelOperator;

@end







