//
//  WeatherView.h
//  weather
//
//  Created by zifei on 2021/3/2.
//

#import "BaseView.h"
@class TempNowView;

#import <QWeather/WeatherBaseClass.h>
NS_ASSUME_NONNULL_BEGIN

@interface WeatherView : BaseView
//@property(nonatomic,strong)UIColor *
@property(nonatomic,strong,readonly)UIView *defaultView;
@property(nonatomic,strong,readonly)TempNowView *tempNowView;



@property(nonatomic,strong)Now *now;
@property(nonatomic,strong)Daily *daily;//当前天气

@end


@interface TempNowView : BaseView

//@property(nonatomic,strong)Now *now;

/*天气实时温度 */
@property(nonatomic,strong,readonly)UILabel *tempLabel;

/*天气温度字 晴 多云 */
@property(nonatomic,strong,readonly)UILabel *tempWordLabel;

/*当前日期 */
@property(nonatomic,strong,readonly)UILabel *timeLabel;

/*风向 风力等级 空气质量*/
@property(nonatomic,strong,readonly)UILabel *windLabel;

@end




/*
@interface SunWeatherView : WeatherView

@property(nonatomic,strong,readonly)SunView *sunView;

@end


@interface MoonWeatherView : WeatherView

@property(nonatomic,strong,readonly)MoonView *moonView;

@end

@interface CloudWeatherView : WeatherView

@property(nonatomic,strong,readonly)CloudView *cloudView;

@end

@interface SnowWeatherView : WeatherView

@property(nonatomic,strong,readonly)SnowView *snowView;

@end

@interface RainWeatherView : WeatherView

@property(nonatomic,strong,readonly)RainView *rainView;

@end

 **/


NS_ASSUME_NONNULL_END
