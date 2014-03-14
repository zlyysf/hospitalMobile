//
//  LZCheckResultImageViewController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-11.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZCheckResultImageViewController.h"

#import "LZCTCheckCell.h"
#import "LZCheckRecordGeneralInfoCell.h"

@interface LZCheckResultImageViewController ()

@end




@implementation LZCheckResultImageViewController{
    NSArray *checkResultDetails;
}

@synthesize checkResultDict;

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
    
    checkResultDetails = checkResultDict[@"details"];
    
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return checkResultDetails.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *detailDict = checkResultDetails[indexPath.row];
    if (indexPath.section==0){
        LZCheckRecordGeneralInfoCell *CheckRecordGeneralInfoCell = [tableView dequeueReusableCellWithIdentifier:@"LZCheckRecordGeneralInfoCell" forIndexPath:indexPath];
//        CheckRecordGeneralInfoCell.labelCheckTime
        CheckRecordGeneralInfoCell.labelCheckCode.text = [NSString stringWithFormat:@"检查号:%@",checkResultDict[@"code"]];
        
        CheckRecordGeneralInfoCell.labelCheckType.text = [NSString stringWithFormat:@"检查类型:%@",checkResultDict[@"checkType"]];
        
        CheckRecordGeneralInfoCell.labelCheckPosition.text = [NSString stringWithFormat:@"检查部位:%@",checkResultDict[@"checkPosition"]];
//        CheckRecordGeneralInfoCell.labelReportTime.text =
        CheckRecordGeneralInfoCell.labelApplyDepartment.text = [NSString stringWithFormat:@"申请科室:%@",checkResultDict[@"applyDepartment"]];
        
        CheckRecordGeneralInfoCell.labelCheckState.text = [NSString stringWithFormat:@"检查状态:%@",checkResultDict[@"checkState"]];
        
        CheckRecordGeneralInfoCell.labelReporter.text = [NSString stringWithFormat:@"报告医师:%@",checkResultDict[@"reporter"]];
        CheckRecordGeneralInfoCell.labelAuditor.text = [NSString stringWithFormat:@"审核医师:%@",checkResultDict[@"auditor"]];
        CheckRecordGeneralInfoCell.labelOperator.text = [NSString stringWithFormat:@"操作技师:%@",checkResultDict[@"operator"]];
        
        CheckRecordGeneralInfoCell.labelCheckWay.text = [NSString stringWithFormat:@"检查方法:%@",checkResultDict[@"checkWay"]];
        
        return CheckRecordGeneralInfoCell;
    }else if (indexPath.section==1){
        LZCTCheckCell *CTCheckCell = [tableView dequeueReusableCellWithIdentifier:@"LZCTCheckCell" forIndexPath:indexPath];
        CTCheckCell.textviewImageDescription.text = detailDict[@"imageDescription"];
        CTCheckCell.textviewImageConclusion.text = detailDict[@"imageConclusion"];
        return CTCheckCell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0){
        return 190;
    }else if (indexPath.section==1){
        return 220;
    }
    return 0;
}
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
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
