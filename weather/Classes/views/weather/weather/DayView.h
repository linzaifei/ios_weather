//
//  DayView.h
//  weather
//
//  Created by zifei on 2021/3/2.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
@class WeatherProgressView;
@interface DayView : BaseView

@end

@interface DayItemView : BaseView

/* 星期 */
@property(nonatomic,strong,readonly)UILabel *weekLabel;

/*date 日期 */
@property(nonatomic,strong,readonly)UILabel *dateLabel;

/*白天天气 */
@property(nonatomic,strong,readonly)UILabel *dayLabel;
/*白天天气icon */
@property(nonatomic,strong,readonly)UILabel *dayIconLabel;

@property(nonatomic,strong,readonly)WeatherProgressView *weatherProgressView;

/*夜晚天气 */
@property(nonatomic,strong,readonly)UILabel *nightLabel;
/*夜晚天气icon */
@property(nonatomic,strong,readonly)UILabel *nightIconLabel;

@end

@interface WeatherProgressView : BaseView
/* 最高温度*/
@property(nonatomic,assign)CGFloat maxTemp;

/* 最低温度*/
@property(nonatomic,assign)CGFloat minTemp;

/* 进度颜色*/
@property(nonatomic,strong)UIColor *color;


@end

NS_ASSUME_NONNULL_END
