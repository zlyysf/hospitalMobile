//
//  LZUtility.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZUtility.h"

@implementation LZUtility


+(double)getSystemVersionValue
{
    return [[[UIDevice currentDevice] systemVersion] doubleValue];
}

+(BOOL)is_IOS7_OR_LATER
{
    return ([self getSystemVersionValue] >= 7.0 );
}

/*
 用于处理从ios7以前到ios7的一个界面兼容性问题，以前的界面的顶部会被statusbar挡住的问题
 */
+(void)SetSubViewExternNone:(UIViewController *)viewController
{
    if ( [self is_IOS7_OR_LATER] )
    {
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
        viewController.extendedLayoutIncludesOpaqueBars = NO;
        viewController.modalPresentationCapturesStatusBarAppearance = NO;
        viewController.automaticallyAdjustsScrollViewInsets = NO;
        viewController.navigationController.navigationBar.translucent = NO;
    }
}

@end
