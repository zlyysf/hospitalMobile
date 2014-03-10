//
//  LZDemoData.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

/*
 病人各种基本信息
 医院各科信息，医院大夫信息，科室与大夫关系信息，大夫工作时间信息，诊室信息，诊室与大夫与工作时间的关联信息，每个科室的每个大夫的提供诊号的量
 
 一个诊号，有ID，科别信息，大夫或普通号，诊室，日期和上午或下午，序号，当前病情，医嘱
     交费记录，病人负担费用，是否交过
     检查项列表
     交费项列表
     消息列表
     开药列表
 
 一个检查项
     有ID，名称描述，检查结果（包括条目列表，图片列表），关联一条交费记录，排队序号
 
 */


#import "LZDemoData.h"

@implementation LZDemoData{
    NSMutableDictionary *zhenhaoSimple1,*zhenhaoSimple2;
    NSMutableArray *zhenhaoSimpleAry;
}

+(LZDemoData *)singleton {
    static dispatch_once_t pred;
    static LZDemoData *shared;
    // Will only be run once, the first time this is called
    dispatch_once(&pred, ^{
        shared = [[LZDemoData alloc] init];
        [shared generateData];
    });
    return shared;
}

-(void)generateData
{
    zhenhaoSimple1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"id001",@"id",@"内科",@"keshi",@"张大夫",@"daifu",[NSNumber numberWithInt:1 ],@"seq", nil];
    zhenhaoSimple2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"id002",@"id",@"外科",@"keshi",@"李大夫",@"daifu",[NSNumber numberWithInt:2 ],@"seq", nil];
    
    zhenhaoSimpleAry = [NSMutableArray arrayWithObjects:zhenhaoSimple1,zhenhaoSimple2, nil];
}

-(NSArray *)get_zhenhaoSimpleAry
{
    return zhenhaoSimpleAry;
}



@end
