//
//  LZPayRegistrationViewController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-19.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZPayRegistrationViewController.h"
#import "LZPayViewController.h"
#import "LZDemoData.h"

@interface LZPayRegistrationViewController ()

@end

@implementation LZPayRegistrationViewController

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
    
    NSDictionary *jiaofeiInfo1,*jianchaInfo1;
    bool forJiancha = false;
    
    if ([self.payType isEqualToString:@"PayRegistration"]){
        self.labelDepartment.text = self.registrationDict[@"department"];
        NSString *doctorOrNormal = self.registrationDict[@"daifu"];
        if (doctorOrNormal.length==0){
            doctorOrNormal = @"普通号";
        }
        self.labelDoctor.text = doctorOrNormal;
    }else if ([self.payType isEqualToString:@"jiaofei"]){
        NSString *jiaofeiType = self.jiaofeiInfo[@"type"];
        if ([jiaofeiType isEqualToString:@"jiancha"]){
            NSString *jianchaId = self.jiaofeiInfo[@"id_jiancha"];
            NSDictionary *jianchaInfo = [[LZDemoData singleton]get_jianchaById:jianchaId];
            
            forJiancha = true;
            jiaofeiInfo1 = self.jiaofeiInfo;
            jianchaInfo1 = jianchaInfo;
            
        }else if([jiaofeiType isEqualToString:@"zhenhao"]){
            NSString *zhenhaoId = self.jiaofeiInfo[@"id_zhenhao"];
            NSDictionary *zhenhaoInfo = [[LZDemoData singleton]get_zhenhaoById:zhenhaoId];
            self.labelDepartment.text = zhenhaoInfo[@"department"];
            self.labelDoctor.text = zhenhaoInfo[@"daifu"];
            self.labelCheckName.text = @"";
            
            NSNumber *nmTotal = self.jiaofeiInfo[@"total"];
            double amountSelf = [nmTotal doubleValue]*0.3;
            double amountYibao = [nmTotal doubleValue]*0.7;
            self.labelAmountTotal.text = [NSString stringWithFormat:@"%.2f",[nmTotal doubleValue]];
            self.labelAmountYibao.text = [NSString stringWithFormat:@"%.2f",amountYibao];
            self.labelAmountSelf.text = [NSString stringWithFormat:@"%.2f",amountSelf];
        }
        
    }else if ([self.payType isEqualToString:@"jiancha"]){
        NSString *jiaofeiId = self.jianchaInfo[@"id_jiaofei"];
        NSDictionary *jiaofeiInfo = [[LZDemoData singleton]get_jiaofeiById:jiaofeiId];
        
        forJiancha = true;
        jiaofeiInfo1 = jiaofeiInfo;
        jianchaInfo1 = self.jianchaInfo;
    }
    
    if(forJiancha){
        self.labelDepartment.text = @"";
        self.labelDoctor.text = @"";
        self.labelCheckName.text = jianchaInfo1[@"name"];
        
        NSNumber *nmTotal = jiaofeiInfo1[@"total"];
        double amountSelf = [nmTotal doubleValue]*0.3;
        double amountYibao = [nmTotal doubleValue]*0.7;
        self.labelAmountTotal.text = [NSString stringWithFormat:@"%.2f",[nmTotal doubleValue]];
        self.labelAmountYibao.text = [NSString stringWithFormat:@"%.2f",amountYibao];
        self.labelAmountSelf.text = [NSString stringWithFormat:@"%.2f",amountSelf];
        
        
    }
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

//#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

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

- (IBAction)btnPayTouchUpInside:(id)sender {
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"RegisterAtHospital" bundle:nil];
    LZPayViewController * subController = [sboard instantiateViewControllerWithIdentifier:@"LZPayViewController"];
    [self.navigationController pushViewController:subController animated:YES];
}
@end
