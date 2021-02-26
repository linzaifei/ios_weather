//
//  SunView.h
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SunView : BaseView
/* 太阳颜色*/
@property(nonatomic,strong)UIColor *sunColor;
/* 太阳宽度 默认 50*/
@property(nonatomic,assign)NSInteger sunSize;

/* 太阳线颜色*/
@property(nonatomic,strong)UIColor *lineColor;
/* 太阳光线间隔 默认 [20,15] */
@property(nonatomic,copy)NSArray<NSNumber *> *lineDash;
/* 太阳线高度 默认 8*/
@property(nonatomic,assign)CGFloat lineHeight;
/* 太阳光线角度 默认 30度*/
@property(nonatomic,assign)CGFloat angle;


/*动画时间 默认 20s */
@property(nonatomic,assign)CGFloat duration;


@end

NS_ASSUME_NONNULL_END
