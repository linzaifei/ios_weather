//
//  HourModal.h
//  weather
//
//  Created by zifei on 2021/3/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HourModal : NSObject
//"fxTime":"2013-12-30T13:00+08:00",
//"temp":2,
//"icon":101,
//"text":"多云",
//"wind360":305,
//"windDir":"西北",
//"windScale":3,
//"windSpeed":15,
//"humidity":40,
//"precip":1.2,
//"pop":5,
//"pressure":1020,
//"cloud":23,
//"dew":1020,
@property(nonatomic,assign) int temp;
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *windDir;
@property(nonatomic,assign) int icon;
@property(nonatomic,assign) int cloud;

@end

NS_ASSUME_NONNULL_END
