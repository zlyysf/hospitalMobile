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
#import "LZAppointmentRegistrationCell.h"
//#import "LZPlaceholderCell.h"
#import "LZPayRegistrationViewController.h"

@interface LZRegisterAtHospitalViewController ()

@property (nonatomic, strong) NSArray *mockRegistrationList;
@property (nonatomic, strong) NSArray *appointmentRegistrations;

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
    self.appointmentRegistrations = [[LZDemoData singleton] get_appointmentRegistrations];
    
    
//    [self.tableView1 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RegistrationTime"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0){
        return 1;
    }else if (section==1){
        return self.appointmentRegistrations.count;
    }else if(section==2){
        return [self.mockRegistrationList count];
    }else{
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RegistrationTime" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section==1){
        LZAppointmentRegistrationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZAppointmentRegistrationCell" forIndexPath:indexPath];
        NSDictionary *appointmentRegistrationDict = self.appointmentRegistrations[indexPath.row];
        cell.labelDepartment.text = appointmentRegistrationDict[@"department"];
        cell.labelDoctor.text = appointmentRegistrationDict[@"daifu"];
        cell.btnRegister.tag = indexPath.row;
        return cell;
    }else if(indexPath.section==2){
        LZRegisterHospitalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalRegisterCell" forIndexPath:indexPath];
        NSDictionary *registerInfo = self.mockRegistrationList[indexPath.row];
        cell.departmentLabel.text = registerInfo[@"department"];
        cell.expertLabel.text = [NSString stringWithFormat:@"专家号：%@", registerInfo[@"expertTickets"]];
        cell.normalLabel.text = [NSString stringWithFormat:@"普通号：%@", registerInfo[@"normalTickets"]];
        
        return cell;

    }else{
        return nil;
    }

    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0){
        return 50;
    }else if (indexPath.section==1){
        return 40;
    }else if(indexPath.section==2){
        return 70;
    }else{
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSString *sectionTitle = nil;
    if (section==0){
        sectionTitle = @"当天放号时间";

    }else if (section==1){
        sectionTitle = @"预约挂号";
    }else if (section==2){
        sectionTitle = @"普通挂号";
    }
    
    return sectionTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    LZRegisterTableViewController *registerViewController = [[LZRegisterTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
//    registerViewController.registrationInfo = self.mockRegistrationList[indexPath.row];
//    [self.navigationController pushViewController:registerViewController animated:YES];
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"RegisterAtHospital" bundle:nil];
    LZRegisterTableViewController * subController = [sboard instantiateViewControllerWithIdentifier:@"LZRegisterTableViewController"];
    subController.registrationInfo = self.mockRegistrationList[indexPath.row];
    [self.navigationController pushViewController:subController animated:YES];
}

- (IBAction)btnRegisterTouchUpInside:(id)sender {
    UIButton *button = sender;
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"RegisterAtHospital" bundle:nil];
    LZPayRegistrationViewController * subController = [sboard instantiateViewControllerWithIdentifier:@"LZPayRegistrationViewController"];
    subController.registrationDict = self.appointmentRegistrations[button.tag];
    [self.navigationController pushViewController:subController animated:YES];
}


@end
