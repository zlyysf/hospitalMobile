//
//  LZDemoData.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

/*
 病人各种基本信息
     身份证号，姓名，是否医保，公司，婚姻状况，病史（建议用选择的方式输入），家族史（指遗传病，用选择方式输入），过敏药物或过敏食物，个人史（指吸烟、饮酒等不良嗜好）
 医院各科信息，医院大夫信息，科室与大夫关系信息，大夫工作时间信息，诊室信息，诊室与大夫与工作时间的关联信息，每个科室的每个大夫的提供诊号的量
 
 挂号需要
     科室列表，有专家姓名的专家号和普通号类别，日期和时间段，总量，可挂数量————可能需要抽象出一个医院提供门诊的单位项目
 
 交费项需要
     交费类别（如挂号交费，检查项目交费，药品交费），总计费用，病人负担费用，是否交纳
 
 一个诊号
     有ID（内部使用），序号，
     可能引用一个医院提供门诊的单位项目，这包括 科别信息，专家大夫名称或普通号，日期和上午或下午，诊室
     还有病人姓名(与病人记录关联)，当前病情描述（预先简单测量的项目，如体温），当前病史描述，医生诊断情况描述，医嘱描述，
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
    
    NSMutableDictionary *zhenhao1,*zhenhao2;
    NSMutableArray *zhenhaoAry;
    NSMutableDictionary *zhenhao1jiaofei, *jiancha1jiaofei,*zhenhao2jiaofei;
    NSMutableDictionary *zhenhao1jiancha1;
    NSMutableDictionary *jiancha1result1detail1;
    NSMutableArray *jiancha1result1ary;
    NSMutableDictionary *zhenhao1yaopin1,*zhenhao1yaopin2;
    NSMutableArray *zhenhao1yaopinAry;

//    NSMutableDictionary *zhenhaoSimple1,*zhenhaoSimple2;
//    NSMutableArray *zhenhaoSimpleAry;
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

//    zhenhaoSimple1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                @"id001",@"id",@"内科",@"department",@"张大夫",@"daifu",[NSNumber numberWithInt:1 ],@"seq", nil];
//    zhenhaoSimple2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                @"id002",@"id",@"外科",@"department",@"李大夫",@"daifu",[NSNumber numberWithInt:2 ],@"seq", nil];
//    zhenhaoSimpleAry = [NSMutableArray arrayWithObjects:zhenhaoSimple1,zhenhaoSimple2, nil];
    
    NSDate *dtNow = [NSDate date];
    //    NSDate *fireDate = [dtNow dateByAddingTimeInterval:LocalNotifyTimeInterval];
    NSCalendar *curCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dtComponentsNow = [curCalendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:dtNow];
    NSDateComponents *dtComponentsLater = [[NSDateComponents alloc] init];
    [dtComponentsLater setYear:dtComponentsNow.year];
    [dtComponentsLater setMonth:dtComponentsNow.month];
    [dtComponentsLater setDay:dtComponentsNow.day];
    [dtComponentsLater setHour:13];
    [dtComponentsLater setMinute:30];
    [dtComponentsLater setSecond:0];
    NSDate *dtGuahao = [curCalendar dateFromComponents:dtComponentsLater];
    
    zhenhao1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"zhenhao001",@"id", [NSNumber numberWithInt:1 ],@"seq",
                @"创伤脑血管神经外科",@"department",@"张大夫",@"daifu", dtGuahao,@"RegisterTime",
                @"左侧眼睑不自主抽动3个月",@"patientDiseaseDescription", @"3个月前，无明显诱因出现左侧眼睑不自主抽动",@"patientDiseaseHistory",
                @"面肌痉挛",@"doctorDiseaseDescription", @"1，3天后复诊。\n2，适当休息。\n3，注意营养饮食。",@"doctorAdvice",
                @"jiaofei001",@"id_jiaofei",
                nil];
    
    zhenhao1jiaofei = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"jiaofei001",@"id", @"zhenhao001",@"id_zhenhao",
                       [NSNumber numberWithDouble:5.0],@"total", [NSNumber numberWithDouble:3.0],@"shouldPay", [NSNumber numberWithInt:0],@"isPaid",
                       nil];
    jiancha1jiaofei = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"jiaofei002",@"id", @"zhenhao001",@"id_zhenhao", @"jiancha001",@"id_jiancha",
                       [NSNumber numberWithDouble:500.0],@"total", [NSNumber numberWithDouble:150.0],@"shouldPay", [NSNumber numberWithInt:0],@"isPaid",
                       nil];

    zhenhao1jiancha1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                        @"jiancha001",@"id",@"jiancha001",@"code", @"zhenhao001",@"id_zhenhao", @"CT：头颈部",@"name", @"jiaofei002",@"id_jiaofei",
                        [NSNumber numberWithInt:0],@"seq", dtNow,@"doneTime", @"MR",@"checkType", @"头颈部",@"checkPosition", @"",@"diseaseName",
                        dtNow,@"reportTime", @"医师王",@"reporter",@"医师王",@"auditor", @"已审核",@"checkState",
                        @"创伤脑血管神经外科",@"applyDepartment", @"",@"operator", @"头颅血管CTA",@"checkWay",
                        nil];
    
    jiancha1result1detail1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"jiancha001",@"id", [NSNumber numberWithInt:1],@"seq", @"pic1.png",@"imagePath",
                       @"颅骨环完整。双侧大脑半球对称，灰白质分界清，大脑实质内未见异常信号影。脑干及双侧小脑半球形态及信号未见异常。各脑室系统、闹池沟未见增宽、变形、移位。中线结构未见移位。双侧上颌窦、筛窦、额窦粘膜增厚，长T1、长T2信号影。",@"imageDescription",
                       @"颅脑MR平扫未见异常；副鼻窦炎",@"imageConclusion",
                       nil];
    
    jiancha1result1ary = [NSMutableArray arrayWithObjects:jiancha1result1detail1, nil];
    
    zhenhao1yaopin1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"yaopin001",@"id", @"zhenhao001",@"id_zhenhao", @"药品名称1",@"name",[NSNumber numberWithInt:2],@"amount",
                       nil];
    zhenhao1yaopin2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"yaopin002",@"id", @"zhenhao001",@"id_zhenhao", @"药品名称2",@"name",[NSNumber numberWithInt:3],@"amount",
                       nil];
    zhenhao1yaopinAry = [NSMutableArray arrayWithObjects:zhenhao1yaopin1,zhenhao1yaopin2, nil];
    
    
    zhenhao2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"zhenhao002",@"id", [NSNumber numberWithInt:4 ],@"seq",
                @"呼吸内科",@"department",@"李大夫",@"daifu", dtGuahao,@"RegisterTime",
                @"咳嗽很厉害，发烧",@"patientDiseaseDescription", @"最近几年多次支气管炎肺炎",@"patientDiseaseHistory",
                @"肺炎症状明显",@"doctorDiseaseDescription", @"多喝水",@"doctorAdvice",
                @"jiaofei002",@"id_jiaofei",
                nil];
    zhenhao2jiaofei = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"jiaofei011",@"id", @"zhenhao002",@"id_zhenhao",
                       [NSNumber numberWithDouble:5.0],@"total", [NSNumber numberWithDouble:3.0],@"shouldPay", [NSNumber numberWithInt:0],@"isPaid",
                       nil];

    zhenhaoAry = [NSMutableArray arrayWithObjects:zhenhao1,zhenhao2, nil];

    
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

//-(NSArray *)get_zhenhaoSimpleAry
//{
//    return zhenhaoSimpleAry;
//}

-(NSArray *)get_zhenhaoAry
{
    return zhenhaoAry;
}


@end














