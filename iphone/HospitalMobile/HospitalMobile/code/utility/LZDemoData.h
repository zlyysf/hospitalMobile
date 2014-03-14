//
//  LZDemoData.h
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZDemoData : NSObject
+(LZDemoData *)singleton;

-(NSMutableDictionary *)get_patientInfo;
-(void)set_patientInfo:(NSDictionary*)patientInfo;

//-(NSArray *)get_zhenhaoSimpleAry;
-(NSArray *)get_zhenhaoAry;
-(NSArray *)get_jiaofeiAry;
-(NSDictionary *)get_zhenhaoById:(NSString*)zhenhaoId;
-(NSDictionary *)get_jianchaById:(NSString*)jianchaId;
-(NSArray *)get_jianchaAryByZhenhao:(NSString*)zhenhaoId;
-(NSArray *)get_yaopinAryByZhenhao:(NSString*)zhenhaoId;

-(NSDictionary *)get_jiaofeiInfoByZhenhao:(NSString*)zhenhaoId;
-(NSDictionary *)get_jiaofeiInfoByJiancha:(NSString*)jianchaId;

-(NSArray *)get_registrationList;

@end
