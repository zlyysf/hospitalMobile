//
//  LZDemoData.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

/*
 病人各种基本信息
     身份证号，姓名，公司，婚姻状况，病史（建议用选择的方式输入），家族史（指遗传病，用选择方式输入），过敏药物或过敏食物，个人史（指吸烟、饮酒等不良嗜好）
 医院各科信息，医院大夫信息，科室与大夫关系信息，大夫工作时间信息，诊室信息，诊室与大夫与工作时间的关联信息，每个科室的每个大夫的提供诊号的量
 
 挂号需要
     科室列表，有专家姓名的专家号和普通号类别，日期和时间段，总量，可挂数量————可能需要抽象出一个医院提供门诊的单位项目
 
 交费项需要
     交费类别（如挂号交费，检查项目交费，药品交费），总计费用，病人负担费用，是否交纳
 
 一个诊号
     有ID（内部使用），序号，
     可能引用一个医院提供门诊的单位项目，这包括 科别信息，专家大夫名称或普通号，日期和上午或下午，诊室
     还有病人姓名(与病人记录关联)，当前病情描述（预先简单测量的项目，如体温），医生诊断情况描述，医嘱描述，
     关联一条交费记录，即对于这个号的交费情况（总计费用，病人负担费用，是否交纳）
     检查项列表
     开药清单
     交费项列表
     消息列表
 
 一个检查项（看来不同类型的检查结果差别比较大，在字段上）(以头颅成像检查为例)
     有ID（内部使用），名称描述，排队序号，（预计排到时间），检查时间，检查号码，检查类型（如MR），检查部位（如头颅成像），疾病名称（可选），报告时间（即出结果时间），报告医师，审核医师，检查状态（如已审核），申请科室，操作技师（可选），检查方法（如头颅平扫），
     关联一条交费记录（总计费用，病人负担费用，是否交纳），
     检查结果对应若干明细项（包括文字描述，文字条目列表，图片列表）
 
 检查结果明细项 以血生化为例 http://www.gamhospital.ac.cn/shenghuazzhi.asp
     明细项名称，测得值，值的单位，正常参考值描述，异常程度（偏高、偏低、正常、严重偏高、严重偏低），范围参考值（可选），图片(对于某些需要图像结果的)，图片表现描述，图片意见（对应影像学表现，影响学意见）
 
 */


#import "LZDemoData.h"

#define Key_patientInfo @"patientInfo"

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
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    zhenhaoSimple1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"id001",@"id",@"内科",@"keshi",@"张大夫",@"daifu",[NSNumber numberWithInt:1 ],@"seq", nil];
    zhenhaoSimple2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"id002",@"id",@"外科",@"keshi",@"李大夫",@"daifu",[NSNumber numberWithInt:2 ],@"seq", nil];
    
    zhenhaoSimpleAry = [NSMutableArray arrayWithObjects:zhenhaoSimple1,zhenhaoSimple2, nil];
}

-(NSMutableDictionary *)get_patientInfo
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *patientInfo = [userDefaults objectForKey:Key_patientInfo];
    NSMutableDictionary *patientInfo2 = [NSMutableDictionary dictionary];
    if (patientInfo!=nil)
        [patientInfo2 addEntriesFromDictionary:patientInfo];
    return patientInfo2;
}
-(void)set_patientInfo:(NSDictionary*)patientInfo
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:patientInfo forKey:Key_patientInfo];
    [userDefaults synchronize];
}

-(NSArray *)get_zhenhaoSimpleAry
{
    return zhenhaoSimpleAry;
}



@end














