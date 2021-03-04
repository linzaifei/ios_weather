//
//  DateUtil.m
//  weather
//
//  Created by zifei on 2021/3/4.
//

#import "DateUtil.h"

@implementation DateUtil


+(NSDictionary*)getDateStrInfo:(NSString *)str{
    return [self getMDW:[DateUtil handleDateStr:str]];
}
+(NSDictionary*)getYYYYMMDDInfo:(NSString *)str{
    return [self getMDW:[DateUtil handleYYYYMMDD:str]];
}
+(NSDictionary *)getMDW:(NSDate*)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger month = [calendar component:NSCalendarUnitMonth fromDate:date];
    NSInteger week = [calendar component:NSCalendarUnitWeekday  fromDate:date];
    NSInteger hour = [calendar component:NSCalendarUnitHour fromDate:date];
    NSInteger day = [calendar component:NSCalendarUnitDay fromDate:date];
    
    NSString *m = month <10? [NSString stringWithFormat:@"0%ld",month]:[NSString stringWithFormat:@"%ld",month];
    NSString *d = day<10? [NSString stringWithFormat:@"0%ld",day]:[NSString stringWithFormat:@"%ld",day];
    NSString *h = hour<10? [NSString stringWithFormat:@"0%ld",hour]:[NSString stringWithFormat:@"%ld",hour];

    NSString *w = @"日一二三四五六";
    w = [w substringWithRange:NSMakeRange(week-1, 1)];
    
    
    return @{
        @"d":d,
        @"m":m,
        @"h":h,
        @"w":w
    };
}

@end

@implementation DateUtil(DateFormatter)

+(NSDate*)handleDateStr:(NSString*)dateStr{
    NSMutableString *r1 = [dateStr mutableCopy];
    [r1 replaceCharactersInRange: [r1 rangeOfString:@"T"] withString:@" "];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm+ss:00"];
    return [dateFormatter dateFromString:r1];
}

+(NSDate*)handleYYYYMMDD:(NSString *)dateStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter dateFromString:dateStr];
}
@end
