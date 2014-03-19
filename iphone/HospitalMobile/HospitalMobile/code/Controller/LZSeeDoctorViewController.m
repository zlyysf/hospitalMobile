//
//  LZSeeDoctorViewController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZSeeDoctorViewController.h"
#import "LZZhenHaoViewController.h"
#import "LZZhenHaoCell.h"
#import "LZDemoData.h"
#import "LZUtility.h"

@interface LZSeeDoctorViewController ()

@end

@implementation LZSeeDoctorViewController{
    NSArray *zhenhaoAry;
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
    
    self.navigationItem.title = @"就诊";
    
    zhenhaoAry = [[LZDemoData singleton]get_zhenhaoAry];

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
    return [zhenhaoAry count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LZZhenHaoCell";
    LZZhenHaoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger rowPos = indexPath.row;
    NSDictionary *zhenhao = zhenhaoAry[rowPos];
    
    cell.labelDaiFu.text = zhenhao[@"daifu"];
    cell.labelKeShi.text = zhenhao[@"department"];
    cell.labelSeq.text = [NSString stringWithFormat:@"%@",zhenhao[@"seq"] ];
    
    NSDate *dtRegisterTime = zhenhao[@"RegisterTime"];
    NSDateFormatter *dtfmt = [[NSDateFormatter alloc]init];
    [dtfmt setDateFormat:@"MM月dd日"];
    NSString *sRegisterDate = [dtfmt stringFromDate:dtRegisterTime];
    cell.labelDate.text = [NSString stringWithFormat:@"%@ %@",sRegisterDate,[LZUtility getDaySpanName:dtRegisterTime]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowPos = indexPath.row;
    NSDictionary *zhenhao = zhenhaoAry[rowPos];
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"SeeDoctor" bundle:nil];
    LZZhenHaoViewController * ZhenHaoViewController = [sboard instantiateViewControllerWithIdentifier:@"LZZhenHaoViewController"];
    ZhenHaoViewController.zhenhaoDict = zhenhao;
    
    ZhenHaoViewController.title = @"诊号";
    [self.navigationController pushViewController:ZhenHaoViewController animated:YES];
    
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
