//
//  LZUtility.h
//  HospitalMobile
//
//  Created by Yasofon on 14-3-10.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZUtility : NSObject

+(double)getSystemVersionValue;
+(BOOL)is_IOS7_OR_LATER;
+(void)SetSubViewExternNone:(UIViewController *)viewController;

+(NSString *)getDaySpanName:(NSDate*)dt;

+(NSMutableArray*)generateArrayWithFillItem:(NSObject*)fillItem andArrayLength:(int)length;

@end
