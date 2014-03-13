//
//  LZMessageViewController.h
//  HospitalMobile
//
//  Created by Dalei Li on 3/13/14.
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZMessageViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong,nonatomic) IBOutlet UIView *bottomBar;

- (void) moveUpBottomBar:(NSNotification*)aNotification;
- (void) moveDownBottomBar:(NSNotification*)aNotification;
@end
