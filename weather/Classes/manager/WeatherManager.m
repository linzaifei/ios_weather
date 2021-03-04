//
//  WeatherManager.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "WeatherManager.h"



@implementation WeatherManager

+(instancetype)shareInstance{
    static WeatherManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

-(void)initWeather{
    QWeatherConfigInstance.publicID = @"HE2102251529471187";
    QWeatherConfigInstance.appKey = @"c3911ba7b0b94c88863615d2dd6eeae9";
    QWeatherConfigInstance.appType = APP_TYPE_DEV;
}

/*
 获取天气信息
 INQUIRE_TYPE :天气类型
 LANGUAGE_TYPE:国家
 unit 单位
 */
-(void)getWeatherInfo:(INQUIRE_TYPE)type lang:(LANGUAGE_TYPE)lang unit:(UNIT_TYPE)unit location:(NSString *)location sub:(WeatherBlock )sub error:(ErrorBlock)block{
    QWeatherConfigInstance.location = location;
    QWeatherConfigInstance.languageType = lang;
    QWeatherConfigInstance.unitType = unit;
    [QWeatherConfigInstance weatherWithInquireType:type WithSuccess:^(WeatherBaseClass  *responseObject) {
            
        NSLog(@"描述->%@",[responseObject description]);
//        sub(responseObject);
        if(sub){
            sub(responseObject);
        }
    } faileureForError:^(NSError *error) {
        NSLog(@"error->%@",error);
        block(error);
    }];
}

/*
 获取天气信息
 INQUIRE_TYPE :天气类型
 默认中国 公制
 */
-(void)getWeatherInfo:(INQUIRE_TYPE)type location:(NSString *)location sub:(WeatherBlock )sub error:(ErrorBlock)block{
    [self getWeatherInfo:type lang:LANGUAGE_TYPE_ZH unit:UNIT_TYPE_M location:location sub:sub error:block];
}
@end
