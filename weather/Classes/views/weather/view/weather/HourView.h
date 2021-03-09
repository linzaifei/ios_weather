//
//  HourView.h
//  weather
//
//  Created by zifei on 2021/3/3.
//

#import "BaseView.h"
#import <QWeather/WeatherBaseClass.h>
NS_ASSUME_NONNULL_BEGIN

@interface HourView : BaseView
@property(nonatomic,copy)NSArray *dataArr;
@end

@interface HourItemView : BaseView
/* hour */
@property(nonatomic,strong,readonly)UILabel *hourLabel;

/*天气icon */
@property(nonatomic,strong,readonly)UILabel *tempIconLabel;

/*温度字 */
@property(nonatomic,strong,readonly)UILabel *tempWordLabel;

/*每小时天气 */
@property(nonatomic,strong,readonly)UILabel *tempLabel;

@end

@interface HourDetailView : BaseView

@property(nonatomic,strong)Hourly *hourly;

@end


@interface IconView : BaseView
/* icon */
@property(nonatomic,strong,readonly)UILabel *iconLabel;
/*文件*/
@property(nonatomic,strong,readonly)UILabel *textLabel;
/* value */
@property(nonatomic,strong,readonly)UILabel *valueLabel;


@end

NS_ASSUME_NONNULL_END
