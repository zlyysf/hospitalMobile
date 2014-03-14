//
//  LZRegisterTableViewController.m
//  HospitalMobile
//
//  Created by Chenglei Shen on 3/14/14.
//  Copyright (c) 2014 Yasofon. All rights reserved.
//

#import "LZRegisterTableViewController.h"
#import "LZPayViewController.h"

@interface LZRegisterTableViewController () <UIAlertViewDelegate>

@end

@implementation LZRegisterTableViewController

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
    
    self.navigationItem.title = self.registrationInfo[@"department"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDelegate DataSource Method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if (section == 0) {
        return @"专家号";
    }
    else if (section == 1) {
        return @"普通号";
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSInteger rowNumOfOneSection = 0;
	switch (section)
	{
		case 0:
			rowNumOfOneSection = [self.registrationInfo[@"expertNum"] integerValue];
			break;
		default: rowNumOfOneSection = 1;
			break;
	}
	return rowNumOfOneSection;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *registration;
    NSString *fee;
    if (indexPath.section == 0) {
        registration = [NSString stringWithFormat:@"专家%@", self.registrationInfo[@"expertList"][indexPath.row][@"name"]];
        fee = @"14";
    }
    else {
        registration = @"普通号";
        fee = @"5";
    }
    
    NSString *alertMessage = [NSString stringWithFormat:@"您已选择了%@，费用为%@元，请点击确认缴费", registration, fee];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:alertMessage
                                                   delegate:self
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确认",nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"RegistrationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrivacyTableViewCellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
	if (indexPath.section == 0) {
		cell.textLabel.text = self.registrationInfo[@"expertList"][indexPath.row][@"name"];
        cell.detailTextLabel.text = [self.registrationInfo[@"expertList"][indexPath.row][@"number"] stringValue];
	}
    else if (indexPath.section == 1) {
        cell.textLabel.text = nil;
        cell.detailTextLabel.text = [self.registrationInfo[@"normalTickets"] stringValue];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44.f;
}

#pragma UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"RegisterAtHospital" bundle:nil];
        LZPayViewController *payController = [board instantiateViewControllerWithIdentifier:@"PayViewController"];
        //[self.navigationController pushViewController:payController animated:YES];
        [self.navigationController presentViewController:payController animated:YES completion:nil];
    }
}

@end
