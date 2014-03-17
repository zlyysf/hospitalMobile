//
//  LZCheckResultTextViewController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-11.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZCheckResultTextViewController.h"
#import "LZXueYeShengHuaCell.h"

@interface LZCheckResultTextViewController ()

@end



@implementation LZCheckResultTextViewController{
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return checkResultDetails.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZXueYeShengHuaCell *XueYeShengHuaCell = [tableView dequeueReusableCellWithIdentifier:@"LZXueYeShengHuaCell" forIndexPath:indexPath];
    NSDictionary *detailDict = checkResultDetails[indexPath.row];
    XueYeShengHuaCell.labelName.text = detailDict[@"itemName"];
    XueYeShengHuaCell.labelValue.text = detailDict[@"value"];
    XueYeShengHuaCell.labelUnit.text = detailDict[@"unit"];
    XueYeShengHuaCell.labelRefValue.text = detailDict[@"refValue"];
    
    NSString *abnormalLevel = detailDict[@"abnormalLevel"];
    NSString *abnormalSign = @"";
    bool isNormal = true;
    if ([@"偏高" isEqualToString:abnormalLevel]){
        abnormalSign = @"↑";
        isNormal = false;
    }else if([@"偏低" isEqualToString:abnormalLevel]){
        abnormalSign = @"↓";
        isNormal = false;
    }
    XueYeShengHuaCell.labelAbnormalLevel.text = abnormalSign;
    if (isNormal){
        XueYeShengHuaCell.labelName.textColor = [UIColor blackColor];
        XueYeShengHuaCell.labelValue.textColor = [UIColor blackColor];
        XueYeShengHuaCell.labelUnit.textColor = [UIColor blackColor];
    }else{
        XueYeShengHuaCell.labelName.textColor = [UIColor blueColor];
        XueYeShengHuaCell.labelValue.textColor = [UIColor blueColor];
        XueYeShengHuaCell.labelUnit.textColor = [UIColor blueColor];
    }
    
    return XueYeShengHuaCell;
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
