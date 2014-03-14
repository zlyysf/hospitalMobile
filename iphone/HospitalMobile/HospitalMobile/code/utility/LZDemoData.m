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
         http://wenku.baidu.com/link?url=8Epmrt_76epJhe-tN4k-2PUwkF09Q5usklKTlDk0xmfLHIsSjttaD8QdqLgGHYkv-mVI8U0wB8z_3WsKf6FDDS7_ppt3MvGuJwQKp2QvwU_
     明细项名称，测得值，值的单位，正常参考值描述，异常程度（偏高、偏低、正常、严重偏高、严重偏低），范围参考值（可选），图片(对于某些需要图像结果的)，图片表现描述，图片意见（对应影像学表现，影响学意见）
 
 */


#import "LZDemoData.h"

#define Key_patientInfo @"patientInfo"

@implementation LZDemoData{
    
    NSMutableDictionary *zhenhao1,*zhenhao2;
    NSMutableArray *zhenhaoAry;
    NSMutableDictionary *zhenhao1jiaofei, *jiancha1jiaofei, *jiancha2jiaofei, *zhenhao2jiaofei;
    NSMutableDictionary *zhenhao1jiancha1,*zhenhao1jiancha2;
    NSMutableDictionary *jiancha1resultDetail1,*jianchaResultDetail;
    NSMutableArray *jiancha1resultAry,*jiancha2resultAry, *zhenhao1jianchaAry;
    NSMutableDictionary *zhenhao1yaopin1,*zhenhao1yaopin2;
    NSMutableArray *zhenhao1yaopinAry;
    
    NSMutableArray *allJiaofeiAry;

//    NSMutableDictionary *zhenhaoSimple1,*zhenhaoSimple2;
//    NSMutableArray *zhenhaoSimpleAry;
    NSArray *registrationArray;
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
                @"zhenhao001",@"id", [NSNumber numberWithInt:12 ],@"seq",
                @"创伤脑血管神经外科",@"department",@"张大夫",@"daifu", dtGuahao,@"RegisterTime",
                @"左侧眼睑不自主抽动3个月",@"patientDiseaseDescription", @"3个月前，无明显诱因出现左侧眼睑不自主抽动",@"patientDiseaseHistory",
                @"面肌痉挛",@"doctorDiseaseDescription", @"1，3天后复诊。\n2，适当休息。\n3，注意营养饮食。",@"doctorAdvice",
                @"jiaofei001",@"id_jiaofei",
                nil];
    
    zhenhao1jiancha1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                        @"jiancha001",@"id",@"jiancha001",@"code", @"zhenhao001",@"id_zhenhao", @"CT：头颈部",@"name", @"jiaofei002",@"id_jiaofei",
                        [NSNumber numberWithInt:0],@"seq", dtNow,@"doneTime", @"MR",@"checkType", @"头颈部",@"checkPosition", @"",@"diseaseName",
                        dtNow,@"reportTime", @"医师王",@"reporter",@"医师王",@"auditor", @"已审核",@"checkState",
                        @"创伤脑血管神经外科",@"applyDepartment", @"",@"operator", @"头颅血管CTA",@"checkWay",
                        nil];
    jiancha1resultDetail1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"jiancha001",@"id", [NSNumber numberWithInt:1],@"seq", @"pic1.png",@"imagePath",
                       @"颅骨环完整。双侧大脑半球对称，灰白质分界清，大脑实质内未见异常信号影。脑干及双侧小脑半球形态及信号未见异常。各脑室系统、闹池沟未见增宽、变形、移位。中线结构未见移位。双侧上颌窦、筛窦、额窦粘膜增厚，长T1、长T2信号影。",@"imageDescription",
                       @"颅脑MR平扫未见异常；副鼻窦炎",@"imageConclusion",
                       nil];
    jiancha1resultAry = [NSMutableArray arrayWithObjects:jiancha1resultDetail1, nil];
    zhenhao1jiancha1[@"details"] = jiancha1resultAry;
    
    zhenhao1jiancha2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                        @"jiancha002",@"id",@"jiancha002",@"code", @"zhenhao001",@"id_zhenhao", @"血液生化",@"name", @"jiaofei003",@"id_jiaofei",
                        [NSNumber numberWithInt:4],@"seq", dtNow,@"doneTime", @"",@"checkType", @"",@"checkPosition", @"",@"diseaseName",
                        dtNow,@"reportTime", @"医师陈",@"reporter",@"医师陈",@"auditor", @"已审核",@"checkState",
                        @"消化内科",@"applyDepartment", @"",@"operator", @"",@"checkWay",
                        nil];
    
    jiancha2resultAry = [NSMutableArray array];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:1],@"seq", @"谷丙转氨酶",@"itemName",
                           @"23",@"value", @"U/L",@"unit", @"0-40",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:1],@"seq", @"谷草转氨酶",@"itemName",
                           @"26",@"value", @"U/L",@"unit", @"0-40",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:1],@"seq", @"总胆红素",@"itemName",
                           @"11.6",@"value", @"umol/L",@"unit", @"0-20",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:2],@"seq", @"直接胆红素",@"itemName",
                           @"2.6",@"value", @"umol/L",@"unit", @"0-6",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:3],@"seq", @"间接胆红素",@"itemName",
                           @"9.0",@"value", @"umol/L",@"unit", @"0-18",@"refValue",
                           nil];
    
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"总蛋白",@"itemName",
                           @"59.9",@"value", @"g/L",@"unit", @"60-81",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"白蛋白",@"itemName",
                           @"43.1",@"value", @"g/L",@"unit", @"35-55",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"白球比",@"itemName",
                           @"1.81",@"value", @"1-2.5",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"碱性磷酸酶",@"itemName",
                           @"81.2",@"value", @"U/L",@"unit", @"20-115",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"谷氨酰转肽酶",@"itemName",
                           @"17.6",@"value", @"U/L",@"unit", @"0-35",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"前白蛋白",@"itemName",
                           @"223.0",@"value", @"mg/L",@"unit", @"150-380",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"总胆汁酸",@"itemName",
                           @"3.8",@"value", @"umol/L",@"unit", @"<10",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"胆碱酯酶",@"itemName",
                           @"8943.0",@"value", @"U/L",@"unit", @"3900-10800",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"乳酸脱氢酶",@"itemName",
                           @"223.7",@"value", @"U/L",@"unit", @"110-240",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"肌酸激酶",@"itemName",
                           @"133.7",@"value", @"U/L",@"unit", @"25-170",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"肌酸激酶同功酶",@"itemName",
                           @"10.2",@"value", @"U/L",@"unit", @"0-24",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"羟丁酸脱氢酶",@"itemName",
                           @"217.3",@"value", @"U/L",@"unit", @"75-200",@"refValue", @"偏高",@"abnormalLevel",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"腺苷脱氨酶",@"itemName",
                           @"12.4",@"value", @"U/L",@"unit", @"4-20",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"α-淀粉酶",@"itemName",
                           @"72.5",@"value", @"U/L",@"unit", @"20-100",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"α-L-岩藻糖苷酶",@"itemName",
                           @"24.5",@"value", @"U/L",@"unit", @"0-40",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"载脂蛋白A１",@"itemName",
                           @"1.77",@"value", @"g/L",@"unit", @"1-1.76",@"refValue", @"偏高",@"abnormalLevel",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"载脂蛋白B",@"itemName",
                           @"0.96",@"value", @"g/L",@"unit", @"0.6-1.1",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"脂蛋白(a)",@"itemName",
                           @"172.0",@"value", @"mg/L",@"unit", @"0-300",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"总胆固醇",@"itemName",
                           @"6.06",@"value", @"mmol/L",@"unit", @"0.1-6",@"refValue", @"偏高",@"abnormalLevel",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"甘油三脂",@"itemName",
                           @"0.82",@"value", @"mmol/L",@"unit", @"0.3-2",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"高密度脂蛋白胆固醇",@"itemName",
                           @"1.92",@"value", @"mmol/L",@"unit", @"0.9-2",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"低密度脂蛋白胆固醇",@"itemName",
                           @"4.01",@"value", @"mmol/L",@"unit", @"正常人群2.1-4",@"refValue", @"偏高",@"abnormalLevel",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];
    jianchaResultDetail = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           @"jiancha002",@"id", [NSNumber numberWithInt:4],@"seq", @"钾",@"itemName",
                           @"3.93",@"value", @"mmol/L",@"unit", @"3.5-5.5",@"refValue",
                           nil];
    [jiancha2resultAry addObject:jianchaResultDetail];

    zhenhao1jiancha2[@"details"] = jiancha2resultAry;
    
    zhenhao1jianchaAry = [NSMutableArray arrayWithObjects:zhenhao1jiancha1,zhenhao1jiancha2, nil];
    
    zhenhao1yaopin1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"yaopin001",@"id", @"zhenhao001",@"id_zhenhao", @"药品名称1",@"name",[NSNumber numberWithInt:2],@"amount", @"盒",@"unit",
                       nil];
    zhenhao1yaopin2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"yaopin002",@"id", @"zhenhao001",@"id_zhenhao", @"药品名称2",@"name",[NSNumber numberWithInt:3],@"amount", @"支",@"unit",
                       nil];
    zhenhao1yaopinAry = [NSMutableArray arrayWithObjects:zhenhao1yaopin1,zhenhao1yaopin2, nil];
    
    
    zhenhao2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"zhenhao002",@"id", [NSNumber numberWithInt:4 ],@"seq",
                @"呼吸内科",@"department",@"李大夫",@"daifu", dtGuahao,@"RegisterTime",
                @"咳嗽很厉害，发烧",@"patientDiseaseDescription", @"最近几年多次支气管炎肺炎",@"patientDiseaseHistory",
                @"肺炎症状明显",@"doctorDiseaseDescription", @"多喝水",@"doctorAdvice",
                @"jiaofei002",@"id_jiaofei",
                nil];
    

    zhenhaoAry = [NSMutableArray arrayWithObjects:zhenhao1,zhenhao2, nil];
    
    
    zhenhao1jiaofei = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"jiaofei001",@"id", @"zhenhao001",@"id_zhenhao", @"zhenhao",@"type",
                       [NSNumber numberWithDouble:5.0],@"total", [NSNumber numberWithDouble:3.0],@"shouldPay", [NSNumber numberWithInt:0],@"isPaid",
                       nil];
    jiancha1jiaofei = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"jiaofei002",@"id", @"zhenhao001",@"id_zhenhao", @"jiancha001",@"id_jiancha", @"jiancha",@"type",
                       [NSNumber numberWithDouble:500.0],@"total", [NSNumber numberWithDouble:150.0],@"shouldPay", [NSNumber numberWithInt:0],@"isPaid",
                       nil];
    jiancha2jiaofei = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"jiaofei003",@"id", @"zhenhao001",@"id_zhenhao", @"jiancha002",@"id_jiancha", @"jiancha",@"type",
                       [NSNumber numberWithDouble:600.0],@"total", [NSNumber numberWithDouble:180.0],@"shouldPay", [NSNumber numberWithInt:0],@"isPaid",
                       nil];
    zhenhao2jiaofei = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"jiaofei011",@"id", @"zhenhao002",@"id_zhenhao", @"zhenhao",@"type",
                       [NSNumber numberWithDouble:5.0],@"total", [NSNumber numberWithDouble:3.0],@"shouldPay", [NSNumber numberWithInt:0],@"isPaid",
                       nil];
    


    
    NSDictionary *registration1 = @{@"department":@"产科", @"expertNum":@3, @"normalTickets":@10, @"expertTickets":@5,
                                    @"expertList":@[@{@"name":@"张大夫", @"number":@2}, @{@"name":@"李大夫", @"number":@2}, @{@"name":@"王大夫", @"number":@1}]};
    NSDictionary *registration2 = @{@"department":@"脑外科", @"expertNum":@3, @"normalTickets":@8, @"expertTickets":@6,
                                    @"expertList":@[@{@"name":@"潘大夫", @"number":@2}, @{@"name":@"李大夫", @"number":@2}, @{@"name":@"王大夫", @"number":@2}]};
    NSDictionary *registration3 = @{@"department":@"呼吸内科", @"expertNum":@4, @"normalTickets":@12, @"expertTickets":@7,
                                    @"expertList":@[@{@"name":@"黄大夫", @"number":@2}, @{@"name":@"李大夫", @"number":@2}, @{@"name":@"王大夫", @"number":@1}, @{@"name":@"申大夫", @"number":@2}]};
    NSDictionary *registration4 = @{@"department":@"普外科", @"expertNum":@4, @"normalTickets":@11, @"expertTickets":@8,
                                    @"expertList":@[@{@"name":@"黄大夫", @"number":@2}, @{@"name":@"李大夫", @"number":@2}, @{@"name":@"王大夫", @"number":@2}, @{@"name":@"申大夫", @"number":@2}]};
    
    registrationArray = @[registration1, registration2, registration3, registration4];

    allJiaofeiAry = [NSMutableArray arrayWithObjects:zhenhao1jiaofei,jiancha1jiaofei,jiancha2jiaofei,zhenhao2jiaofei, nil];


    
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

-(NSArray *)get_jianchaAryByZhenhao:(NSString*)zhenhaoId
{
    if ([@"zhenhao001" isEqualToString:zhenhaoId])
        return zhenhao1jianchaAry;
    else
        return nil;
}
-(NSArray *)get_yaopinAryByZhenhao:(NSString*)zhenhaoId
{
    if ([@"zhenhao001" isEqualToString:zhenhaoId])
        return zhenhao1yaopinAry;
    else
        return nil;
}

-(NSDictionary *)get_jiaofeiInfoByZhenhao:(NSString*)zhenhaoId
{
    for(int i=0; i<allJiaofeiAry.count; i++){
        NSDictionary *jiaofeiInfo = allJiaofeiAry[i];
        if ([@"zhenhao" isEqualToString:jiaofeiInfo[@"type"]] && [zhenhaoId isEqualToString:jiaofeiInfo[@"id_zhenhao"]])
            return jiaofeiInfo;
    }
    return nil;
}
-(NSDictionary *)get_jiaofeiInfoByJiancha:(NSString*)jianchaId
{
    for(int i=0; i<allJiaofeiAry.count; i++){
        NSDictionary *jiaofeiInfo = allJiaofeiAry[i];
        if ([@"jiancha" isEqualToString:jiaofeiInfo[@"type"]] && [jianchaId isEqualToString:jiaofeiInfo[@"id_jiancha"]])
            return jiaofeiInfo;
    }
    return nil;
}

-(NSArray *)get_registrationList
{
    return registrationArray;
}

@end














