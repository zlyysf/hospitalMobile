//
//  LZMainTabBarController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZMainTabBarController.h"
#import "LZInfoInputTableViewController.h"
#import "LZRegisterAtHospitalViewController.h"
#import "LZFeeListViewController.h"
#import "LZSeeDoctorViewController.h"
#import "LZMessageViewController.h"
#import "LZUtility.h"

@interface LZMainTabBarController ()

@end

@implementation LZMainTabBarController

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
	
    NSMutableArray *controllers = [NSMutableArray array];
    UINavigationController *nav;
    UITabBarItem *tabBarItem;
    
    UIStoryboard *sbInfoInput = [UIStoryboard storyboardWithName:@"InfoInput" bundle:nil];
    LZInfoInputTableViewController *InfoInputViewController = [sbInfoInput instantiateViewControllerWithIdentifier:@"LZInfoInputTableViewController"];
    nav = [[ UINavigationController alloc] initWithRootViewController:InfoInputViewController];
    nav.navigationBar.translucent = NO;
    tabBarItem = [[UITabBarItem alloc]initWithTitle:@"信息" image:[UIImage imageNamed:@"tabbarIconDefault.png"] tag:0];
    nav.tabBarItem = tabBarItem;
    [controllers addObject:nav];
    
    UIStoryboard *sbRegisterAtHospital = [UIStoryboard storyboardWithName:@"RegisterAtHospital" bundle:nil];
    LZRegisterAtHospitalViewController *RegisterAtHospitalViewController = [sbRegisterAtHospital instantiateViewControllerWithIdentifier:@"LZRegisterAtHospitalViewController"];
    nav = [[ UINavigationController alloc] initWithRootViewController:RegisterAtHospitalViewController];
    nav.navigationBar.translucent = NO;
    tabBarItem = [[UITabBarItem alloc]initWithTitle:@"挂号" image:[UIImage imageNamed:@"tabbarIconDefault.png"] tag:1];
    nav.tabBarItem = tabBarItem;
    [controllers addObject:nav];
    
    UIStoryboard *sbFeeList = [UIStoryboard storyboardWithName:@"FeeList" bundle:nil];
    LZFeeListViewController *FeeListViewController = [sbFeeList instantiateViewControllerWithIdentifier:@"LZFeeListViewController"];
    nav = [[ UINavigationController alloc] initWithRootViewController:FeeListViewController];
    nav.navigationBar.translucent = NO;
    tabBarItem = [[UITabBarItem alloc]initWithTitle:@"交费" image:[UIImage imageNamed:@"tabbarIconDefault.png"] tag:1];
    nav.tabBarItem = tabBarItem;
    [controllers addObject:nav];
    
    UIStoryboard *sbSeeDoctor = [UIStoryboard storyboardWithName:@"SeeDoctor" bundle:nil];
    LZSeeDoctorViewController *SeeDoctorViewController = [sbSeeDoctor instantiateViewControllerWithIdentifier:@"LZSeeDoctorViewController"];
    nav = [[ UINavigationController alloc] initWithRootViewController:SeeDoctorViewController];
    nav.navigationBar.translucent = NO;
    tabBarItem = [[UITabBarItem alloc]initWithTitle:@"看病" image:[UIImage imageNamed:@"tabbarIconDefault.png"] tag:1];
    nav.tabBarItem = tabBarItem;
    [controllers addObject:nav];
    
    UIStoryboard *sbMessage = [UIStoryboard storyboardWithName:@"Message" bundle:nil];
    LZMessageViewController *MessageViewController = [sbMessage instantiateViewControllerWithIdentifier:@"LZMessageViewController"];
    nav = [[ UINavigationController alloc] initWithRootViewController:MessageViewController];
    nav.navigationBar.translucent = NO;
    tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息管理" image:[UIImage imageNamed:@"tabbarIconDefault.png"] tag:1];
    nav.tabBarItem = tabBarItem;
    [controllers addObject:nav];
    
    self.viewControllers = controllers;
//    if ([LZUtility is_IOS7_OR_LATER])
//    {
//        self.tabBar.translucent = NO;
//    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
