//
//  LZInfoInputTableViewController.m
//  HospitalMobile
//
//  Created by Dalei Li on 3/12/14.
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import "LZInfoInputTableViewController.h"
#import "LZMultiSelectDiseaseController.h"

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
        [self showMultiSelectDiseaseController:self.textfieldDiseaseHistory];
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


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



- (IBAction)textfieldDiseaseHistoryTouchDown:(id)sender {
    NSLog(@"textfieldDiseaseHistoryTouchDown");
    [self textFieldOnClickHandler:sender];
}

- (IBAction)textfieldDiseaseHistoryTouchDownRepeat:(id)sender {
    NSLog(@"textfieldDiseaseHistoryTouchDownRepeat");//not been triggered
    [self textFieldOnClickHandler:sender];
}

- (IBAction)textfieldDiseaseHistoryEditingDidBegin:(id)sender {
    NSLog(@"textfieldDiseaseHistoryEditingDidBegin");
    [self textFieldOnClickHandler:sender];
}

-(void)textFieldOnClickHandler:(UITextField*)tf
{
    [tf resignFirstResponder];
    [self showMultiSelectDiseaseController:tf];
}
-(void)showMultiSelectDiseaseController:(UITextField*)tf
{
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"InfoInput" bundle:nil];
    LZMultiSelectDiseaseController * subController = [sboard instantiateViewControllerWithIdentifier:@"LZMultiSelectDiseaseController"];
    subController.outerTextField = tf;
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

@end
