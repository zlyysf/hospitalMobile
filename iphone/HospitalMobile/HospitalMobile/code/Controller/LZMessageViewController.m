//
//  LZMessageViewController.m
//  HospitalMobile
//
//  Created by Dalei Li on 3/13/14.
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import "LZMessageViewController.h"

@interface LZMessageViewController ()

@end


@implementation LZMessageViewController

@synthesize bottomBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if ([indexPath row] == 0)
        cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell1" forIndexPath:indexPath];
    else if ([indexPath row] == 1)
        cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell2" forIndexPath:indexPath];
    else
        cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell3" forIndexPath:indexPath];
    
    return cell;
}


- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moveUpBottomBar:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moveDownBottomBar:) name:UIKeyboardWillHideNotification object:nil];
}
- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) moveUpBottomBar:(NSNotification*)aNotification {
    
    NSDictionary* userInfo = [aNotification userInfo];
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardFrame;
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] getValue:&keyboardFrame];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    [self.bottomBar setFrame:CGRectMake(self.bottomBar.frame.origin.x, self.bottomBar.frame.origin.y - keyboardFrame.size.height, self.bottomBar.frame.size.width, self.bottomBar.frame.size.height)];
    

    [UIView commitAnimations];
}


- (void) moveDownBottomBar:(NSNotification*)aNotification {
    NSDictionary* userInfo = [aNotification userInfo];
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardFrame;
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    [self.bottomBar setFrame:CGRectMake(self.bottomBar.frame.origin.x, self.bottomBar.frame.origin.y + keyboardFrame.size.height, self.bottomBar.frame.size.width, self.bottomBar.frame.size.height)];
    
    
    [UIView commitAnimations];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
