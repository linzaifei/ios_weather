//
//  RainChartView.h
//  weather
//
//  Created by zifei on 2021/3/10.
//

#import "BaseView.h"
#import <QWeather/QWeather.h>
@class RainChartView;
NS_ASSUME_NONNULL_BEGIN
@interface RainWeatherCharts : BaseView
@property(nonatomic,strong,readonly)RainChartView *rainChartView;
@property(nonatomic,strong)WeatherMinutelyBaseClass *modal;
@end


@interface RainChartView : BaseView

@property(nonatomic,strong)NSArray *values;


/* 列 */
@property(nonatomic,assign)int col;
/* 行 */
@property(nonatomic,assign)int row;


/**上左右 边距 默认 20 */
@property(nonatomic,assign)CGFloat space;

/**下 边距 默认 50 */
@property(nonatomic,assign)CGFloat bottom_space;

/**线宽 2 */
@property(nonatomic,assign)int lineWidth;


/**等均线线颜色 */
@property(nonatomic,strong)UIColor *lineColor;
/**虚线线颜色*/
@property(nonatomic,strong)UIColor *lineDashColor;



/*
 水平
 */
@property(nonatomic,strong)UIColor *rowColor;

/*
 垂直
 */
@property(nonatomic,strong)UIColor *colColor;



@end

@interface RainChartView(values)

+(NSArray *)getValuePointsWithArr:(NSArray*)arr row:(CGFloat)row col:(CGFloat)col max:(CGFloat)max;

@end



NS_ASSUME_NONNULL_END
