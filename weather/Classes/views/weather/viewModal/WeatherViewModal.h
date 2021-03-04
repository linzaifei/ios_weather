//
//  WeatherViewModal.h
//  weather
//
//  Created by zifei on 2021/3/4.
//

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"
NS_ASSUME_NONNULL_BEGIN

@interface WeatherViewModal : NSObject

/* 实时天气数据 */
@property(nonatomic,strong)RACCommand *nowCommend;

/* 3d天气数据 */
@property(nonatomic,strong)RACCommand *threeCommend;

/* 15d天气数据 */
@property(nonatomic,strong)RACCommand *fifteenCommend;

/* 24h天气数据 */
@property(nonatomic,strong)RACCommand *hourCommend;


@end

NS_ASSUME_NONNULL_END
