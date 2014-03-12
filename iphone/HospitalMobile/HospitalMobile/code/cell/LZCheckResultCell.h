//
//  LZCheckResultCell.h
//  HospitalMobile
//
//  Created by Yasofon on 14-3-12.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZCheckResultCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelCheckItemName;

@property (weak, nonatomic) IBOutlet UIButton *buttonPayCheck;

@property (weak, nonatomic) IBOutlet UILabel *labelWaitQueueInfo;


@property (weak, nonatomic) IBOutlet UILabel *labelResultOutcomeState;


@property (weak, nonatomic) IBOutlet UILabel *labelResultEstimateTime;


@property (weak, nonatomic) IBOutlet UIButton *buttonSeeResult;






@end
