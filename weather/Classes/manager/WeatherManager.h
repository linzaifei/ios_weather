//
//  WeatherManager.h
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import <Foundation/Foundation.h>
#import <QWeather/QWeather.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^WeatherBlock)(WeatherBaseClass *modal);
typedef void(^WeatherMuinteBlock)(WeatherMinutelyBaseClass *modal);
typedef void (^ErrorBlock) (NSError *error);
@interface WeatherManager : NSObject

+(instancetype)shareInstance;

-(void)initWeather;


/*
 获取天气信息
 INQUIRE_TYPE :天气类型
 LANGUAGE_TYPE:国家
 unit 单位
 */
-(void)getWeatherInfo:(INQUIRE_TYPE)type lang:(LANGUAGE_TYPE)lang unit:(UNIT_TYPE)unit location:(NSString *)location sub:(WeatherBlock )sub error:(ErrorBlock)block;

/*
 获取天气信息
 INQUIRE_TYPE :天气类型
 默认中国 公制
 */
-(void)getWeatherInfo:(INQUIRE_TYPE)type location:(NSString *)location sub:(WeatherBlock)sub error:(ErrorBlock)block;


/**
 分钟级别降雨量
 */
-(void)getMinuteInfo:(NSString*)url params:(NSDictionary*)params sub:(WeatherMuinteBlock )sub error:(ErrorBlock)block;

@end

NS_ASSUME_NONNULL_END
