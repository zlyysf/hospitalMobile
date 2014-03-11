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

-(NSArray *)get_zhenhaoSimpleAry;

@end
