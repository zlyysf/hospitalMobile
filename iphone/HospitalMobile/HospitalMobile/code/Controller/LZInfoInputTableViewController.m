//
//  LZInfoInputTableViewController.m
//  HospitalMobile
//
//  Created by Dalei Li on 3/12/14.
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import "LZInfoInputTableViewController.h"
#import "LZMultiSelectDiseaseController.h"
#import "LZKeyboardToolBarToHideKB.h"

@interface LZInfoInputTableViewController ()

@property (nonatomic, assign) NSUInteger genderIndex;

@end

@implementation LZInfoInputTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (section == 0)
        return 11;
    else {
        if (self.genderIndex == 0)
            return 7;
        else
            return 8;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if (indexPath.section == 1 && indexPath.row == 1){
//        [self showMultiSelectDiseaseController:self.textfieldDiseaseHistory];
        [self showMultiSelectDiseaseController:self.textviewDiseaseHistory];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (range.length==0) {
        if ([text isEqualToString:@"\n"]) {
            [textView resignFirstResponder];
            return NO;
        }
    }
    
    return YES;
}

-(void)showMultiSelectDiseaseController:(NSObject*)textCtrl
{
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"InfoInput" bundle:nil];
    LZMultiSelectDiseaseController * subController = [sboard instantiateViewControllerWithIdentifier:@"LZMultiSelectDiseaseController"];
    if ([textCtrl isKindOfClass:UITextField.class]){
        subController.outerTextField = (UITextField*)textCtrl;
    }else if ([textCtrl isKindOfClass:UITextView.class]){
        subController.outerTextView = (UITextView*)textCtrl;
    }
    
    [self.navigationController pushViewController:subController animated:YES];
}

- (IBAction)doSave:(UIBarButtonItem *)sender {
    
    if (sender.tintColor == [UIColor grayColor])
        sender.tintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    else
        sender.tintColor = [UIColor grayColor];
}

- (IBAction)switchGender:(id)sender
{
    UISegmentedControl *genderSegment = sender;
    if (self.genderIndex != genderSegment.selectedSegmentIndex) {
        self.genderIndex = genderSegment.selectedSegmentIndex;
        [self.tableView reloadData];
    }
}


#pragma mark- UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (textView.inputAccessoryView == nil){
        LZKeyboardToolBarToHideKB *keyboardToolbar = [LZKeyboardToolBarToHideKB newOne_withDoneButtonTitle:@"完成" andTextCtrl:textView];
        textView.inputAccessoryView = keyboardToolbar;
    }
    return YES;
}




@end
