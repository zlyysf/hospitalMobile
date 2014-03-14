//
//  LZFeeListViewController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZFeeListViewController.h"
#import "LZFeeCell.h"
#import "LZDemoData.h"

@interface LZFeeListViewController ()

@end

@implementation LZFeeListViewController{
    NSArray *feeAry;
}

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
    
    self.navigationItem.title = @"交费";
    
    feeAry = [[LZDemoData singleton]get_jiaofeiAry];

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return feeAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZFeeCell *FeeCell = [tableView dequeueReusableCellWithIdentifier:@"LZFeeCell" forIndexPath:indexPath];
    NSDictionary *feeInfo = feeAry[indexPath.row];
    
    NSString *feeType = feeInfo[@"type"];
    if ([feeType isEqualToString:@"zhenhao"]){
        NSString *zhenhaoId = feeInfo[@"id_zhenhao"];
        NSDictionary *zhenhao = [[LZDemoData singleton] get_zhenhaoById:zhenhaoId];
        FeeCell.labelName.text = [NSString stringWithFormat:@"%@ %@", zhenhao[@"department"],zhenhao[@"daifu"]];
    }else{
        NSString *jianchaId = feeInfo[@"id_jiancha"];
        NSDictionary *jiancha = [[LZDemoData singleton] get_jianchaById:jianchaId];
        FeeCell.labelName.text =  [NSString stringWithFormat:@"%@", jiancha[@"name"]];
    }
    FeeCell.labelTotal.text = [NSString stringWithFormat:@"总计:%@", feeInfo[@"total"]];
    FeeCell.labelTotal.textAlignment = NSTextAlignmentRight;
    FeeCell.labelOwnExpense.text = [NSString stringWithFormat:@"自费:%@", feeInfo[@"shouldPay"]];
    FeeCell.labelOwnExpense.textAlignment = NSTextAlignmentRight;
    
    NSDateFormatter *dtfmt = [[NSDateFormatter alloc]init];
    [dtfmt setDateFormat:@"yyyyMMdd HH:mm"];
    FeeCell.labelTime.text = [dtfmt stringFromDate:feeInfo[@"createTime"]];
    NSNumber *nmPaid = feeInfo[@"isPaid"];
    FeeCell.buttonPay.hidden = ([nmPaid intValue]==1);
    
    return FeeCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
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
