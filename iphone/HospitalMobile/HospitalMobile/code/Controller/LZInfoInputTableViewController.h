//
//  LZInfoInputTableViewController.h
//  HospitalMobile
//
//  Created by Dalei Li on 3/12/14.
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZInfoInputTableViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate>


- (IBAction)doSave:(UIBarButtonItem *)sender;
- (IBAction)switchGender:(id)sender;

@end
