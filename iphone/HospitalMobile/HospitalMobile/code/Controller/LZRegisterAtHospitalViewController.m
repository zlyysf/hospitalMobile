//
//  LZRegisterAtHospitalViewController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZRegisterAtHospitalViewController.h"
#import "LZRegisterHospitalCell.h"
#import "LZDemoData.h"
#import "LZRegisterTableViewController.h"

@interface LZRegisterAtHospitalViewController ()

@property (nonatomic, strong) NSArray *mockRegistrationList;

@end

@implementation LZRegisterAtHospitalViewController

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
    self.navigationItem.title = @"挂号";
    self.mockRegistrationList = [[LZDemoData singleton] get_registrationList];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mockRegistrationList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HospitalRegisterCell";
    LZRegisterHospitalCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *registerInfo = self.mockRegistrationList[indexPath.row];
    cell.departmentLabel.text = registerInfo[@"department"];
    cell.expertLabel.text = [NSString stringWithFormat:@"专家号：%@", registerInfo[@"expertTickets"]];
    cell.normalLabel.text = [NSString stringWithFormat:@"普通号：%@", registerInfo[@"normalTickets"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZRegisterTableViewController *registerViewController = [[LZRegisterTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    registerViewController.registrationInfo = self.mockRegistrationList[indexPath.row];
    [self.navigationController pushViewController:registerViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
