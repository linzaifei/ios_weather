//
//  DateUtil.h
//  weather
//
//  Created by zifei on 2021/3/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateUtil : NSObject



+(NSDictionary*)getDateStrInfo:(NSString *)str;

+(NSDictionary*)getYYYYMMDDInfo:(NSString *)str;
@end

@interface DateUtil(DateFormatter)

+(NSDate*)handleDateStr:(NSString*)dateStr;
//2021-03-04
+(NSDate*)handleYYYYMMDD:(NSString *)dateStr;
@end

NS_ASSUME_NONNULL_END
